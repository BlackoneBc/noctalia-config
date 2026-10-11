# Noctalia config for Arch

Dieses Repository enthält eine vorsichtige, portable Noctalia-Konfiguration für Arch Linux. Das Ziel ist, dass sie auf einem frischen System möglichst ohne persönliche Pfade, Monitor-Namen, App-IDs oder Hardware-spezifische Absolutpfade funktioniert.

Vor dem Ausführen:
- lege dein Wallpaper als `Wallpaper.jpg` in das Hauptverzeichnis dieses Repositories
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
- Es entfernt system- und nutzerspezifische Pfade und setzt portable Standardwerte, damit die Config auf einem fremden Arch-PC nicht sofort fehlschlägt.

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

Hinweis zur Vorsicht:
- Es gibt keine 100% garantierte "Plug-and-play"-Config für jeden Rechner, weil Noctalia noch auf Monitorauflösung, Ausgabegeräte, Wayland-Compositor und installierte Anwendungen reagieren kann.
- Die Konfigurationsdateien in diesem Repo sind aber bewusst so gehalten, dass sie auf einem frischen Arch-System mit Standard-Apps möglichst stabil laufen.
- Wenn ein Monitor oder eine App anders heißt, erkennt Noctalia das normalerweise selbst, oder du kannst die Werte nach der ersten Installation im GUI anpassen.
