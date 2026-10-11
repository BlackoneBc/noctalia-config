#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/noctalia"
wallpaper_dir="$HOME/Pictures/Noctalia/Wallpapers"

if ! command -v git >/dev/null 2>&1; then
  echo "[1/5] Installing git..."
  sudo pacman -S --needed --noconfirm git
fi

if ! command -v meson >/dev/null 2>&1 || ! command -v ninja >/dev/null 2>&1; then
  echo "[1/5] Installing build dependencies for Noctalia..."
  sudo pacman -S --needed --noconfirm base-devel meson ninja cmake git wayland-protocols pkgconf
fi

if ! command -v python3 >/dev/null 2>&1; then
  echo "[1/5] Installing Python..."
  sudo pacman -S --needed --noconfirm python
fi

if ! command -v noctalia >/dev/null 2>&1; then
  echo "[2/5] Building and installing Noctalia from upstream..."
  tmpdir="$(mktemp -d)"
  trap 'rm -rf "$tmpdir"' EXIT
  git clone --depth 1 https://github.com/noctalia-dev/noctalia.git "$tmpdir/noctalia"
  cd "$tmpdir/noctalia"
  meson setup build --prefix=/usr
  ninja -C build
  sudo ninja -C build install
fi

echo "[3/5] Preparing config directory and wallpaper folder..."
mkdir -p "$config_dir" "$wallpaper_dir"

if [[ ! -f "$repo_dir/Wallpaper.jpg" ]]; then
  echo "ERROR: Wallpaper.jpg not found in $repo_dir"
  exit 1
fi

cp -f "$repo_dir/config/colors.json" "$config_dir/colors.json"
cp -f "$repo_dir/config/plugins.json" "$config_dir/plugins.json"
cp -f "$repo_dir/Wallpaper.jpg" "$wallpaper_dir/Wallpaper.jpg"

echo "[4/5] Processing settings.json for your system..."

python3 - "$config_dir" "$wallpaper_dir" "$repo_dir/config/settings.json" <<'PY'
import json
import os
import sys

config_dir = sys.argv[1]
wallpaper_dir = sys.argv[2]
settings_path = sys.argv[3]

with open(settings_path, 'r', encoding='utf-8') as f:
    settings = json.load(f)

wallpaper_path = os.path.join(wallpaper_dir, 'Wallpaper.jpg')

settings['general']['avatarImage'] = wallpaper_path
settings['wallpaper']['directory'] = wallpaper_dir
settings['wallpaper']['enabled'] = True
settings['wallpaper']['favorites'] = [{
    "appearance": "dark",
    "colorScheme": "Catppuccin",
    "darkMode": True,
    "generationMethod": "tonal-spot",
    "paletteColors": ["#cba6f7", "#fab387", "#94e2d5", "#f38ba8"],
    "path": wallpaper_path,
    "useWallpaperColors": False,
}]
settings['wallpaper']['monitorDirectories'] = []
settings['wallpaper']['setWallpaperOnAllMonitors'] = True

settings['appLauncher']['pinnedApps'] = [
    'firefox',
    'org.gnome.Nautilus',
    'Alacritty',
    'org.gnome.Terminal'
]
settings['dock']['pinnedApps'] = [
    'firefox',
    'org.gnome.Nautilus',
    'org.gnome.Terminal',
    'Alacritty'
]

if 'desktopWidgets' in settings:
    settings['desktopWidgets']['enabled'] = False
    settings['desktopWidgets']['monitorWidgets'] = []
    settings['desktopWidgets']['overviewEnabled'] = False

for section in ['bar', 'dock', 'notifications', 'osd']:
    if section in settings and 'monitors' in settings[section]:
        settings[section]['monitors'] = []

with open(os.path.join(config_dir, 'settings.json'), 'w', encoding='utf-8') as f:
    json.dump(settings, f, indent=4)
    f.write('\n')
PY

echo "[5/5] Done. Noctalia is installed and configured."
echo "Wallpaper: $wallpaper_dir/Wallpaper.jpg"
echo "Config: $config_dir/"
