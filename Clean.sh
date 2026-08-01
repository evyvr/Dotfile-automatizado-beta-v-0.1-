#!/bin/bash

CONFIG_DIR="$HOME/.config"

echo "=========================================="
echo "  Limpiando configuraciones anteriores..."
echo "=========================================="

OLD_CONFIGS=(
    "$CONFIG_DIR/hyde"
    "$CONFIG_DIR/hype"
    "$CONFIG_DIR/hypr"
    "$CONFIG_DIR/mugen-shell"
    "$CONFIG_DIR/caelestia"
)

for target in "${OLD_CONFIGS[@]}"; do
    if [ -e "$target" ] || [ -L "$target" ]; then
        rm -rf "$target"
        echo "[✓] Eliminado rastro anterior: $target"
    else
        echo "[-] No existe (limpio): $target"
    fi
done

echo "=========================================="
echo "¡Sistema limpio! Listo para instalar."
echo "=========================================="
