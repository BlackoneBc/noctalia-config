# Noctalia config for Arch

Dieses Repository enthält eine portable Noctalia v5-Konfiguration für Arch Linux. Ziel ist, dass sie auf einem frischen System möglichst ohne persönliche Pfade, Monitor-Namen, App-IDs oder Hardware-spezifische Absolutpfade funktioniert.

## Schnellstart

Wenn du dein Bild direkt als `Wallpaper.jpg` hast:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/BlackoneBc/noctalia-config/main/install-noctalia.sh) ~/Downloads/Wallpaper.jpg
```

Oder lokal im Repo:

```bash
git clone https://github.com/BlackoneBc/noctalia-config.git
cd noctalia-config
cp /pfad/zu/deinem/Wallpaper.jpg ./Wallpaper.jpg
./install-noctalia.sh ./Wallpaper.jpg
```

## Was das Skript macht

- installiert Build-Dependencies für Arch (`base-devel`, `meson`, `ninja`, etc.)
- baut Noctalia aus dem offiziellen Upstream-Repository
- legt `~/.config/noctalia/` an
- kopiert `colors.json`, `plugins.json` und `settings.json`
- kopiert dein Wallpaper korrekt nach `~/Pictures/Noctalia/Wallpapers/`
- setzt den richtigen Pfad in der Noctalia-Config
- hält die Konfiguration portable und vermeidet hardcodierte persönliche Pfade

## Wichtige Hinweise

- Die Konfiguration enthält bewusst keine persönlichen Pfade mehr.
- Alle App-Shortcuts sind auf allgemeine, standardmäßige Programme beschränkt.
- Die besonders auflösungs- und monitorabhängigen Desktop-Widgets wurden vorsichtig deaktiviert, damit sie auf fremden Systemen nicht direkt kaputtgehen.
- Noctalia erkennt typische Hardware- und App-Namen oft selbst; bei Bedarf kannst du danach im GUI noch Feineinstellungen vornehmen.

## Dateien

- `config/colors.json`
- `config/plugins.json`
- `config/settings.json`
- `install-noctalia.sh`
