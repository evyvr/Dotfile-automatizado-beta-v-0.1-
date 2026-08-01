#!/bin/bash

VIDEO_PATH="$1"

if [ -z "$VIDEO_PATH" ]; then
    echo "Uso: $0 /ruta/al/video.mp4"
    exit 1
fi

pkill mpvpaper

mpvpaper -o "no-audio --loop" * "$VIDEO_PATH" &

THUMBNAIL="/tmp/mugen_current_wallpaper.png"
ffmpeg -y -i "$VIDEO_PATH" -vframes 1 "$THUMBNAIL" &> /dev/null

if command -v matugen &> /dev/null; then
    matugen image "$THUMBNAIL"
elif command -v wal &> /dev/null; then
    wal -i "$THUMBNAIL"
fi

pkill mugen-shell && mugen-shell &
if pgrep kitty > /dev/null; then
    kill -SIGUSR1 $(pgrep kitty)
fi

echo "¡Video de fondo y colores dinámicos aplicados!"
