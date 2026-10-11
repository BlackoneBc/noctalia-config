# Noctalia config for Arch

Dieses Repository enthält meine Noctalia-Konfigurationen (`colors.json`, `plugins.json`, `settings.json`) plus ein Installationsskript, das auf Arch Linux automatisch Noctalia baut und installiert und die Konfiguration sowie das Wallpaper an die richtige Stelle kopiert.

Vor dem Ausführen:
- lege dein Wallpaper als `Wallpaper.jpg` in diesem Repository-Verzeichnis ab
- dann starte den Befehl unten

Befehl:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/BlackoneBc/noctalia-config/main/install-noctalia.sh)
```

Wichtig:
- Das Skript installiert die nötigen Pakete für Arch Linux.
- Es baut Noctalia aus dem offiziellen Upstream-Repository.
- Es kopiert die Konfigurationsdateien nach `~/.config/noctalia/`.
- Es erstellt den Wallpaper-Pfad unter `~/Pictures/Noctalia/Wallpapers/` und kopiert dort `Wallpaper.jpg` hinein.
- Es setzt den Wallpaper-Pfad in `settings.json` automatisch auf diesen Ordner.

Wenn du das Repository lokal auscheckst, kannst du auch direkt so starten:

```bash
chmod +x install-noctalia.sh
./install-noctalia.sh
```

Dateien im Repo:
- `config/colors.json`
- `config/plugins.json`
- `config/settings.json`
- `install-noctalia.sh`
