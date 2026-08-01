#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

echo "=========================================="
echo "  Desplegando Dotfiles (Mugen + Hyde + Caelestia)"
echo "=========================================="

DEPENDENCIES=("mpvpaper" "ffmpeg" "matugen" "kitty")

echo "Verificando dependencias del sistema..."
for pkg in "${DEPENDENCIES[@]}"; do
    if ! command -v "$pkg" &> /dev/null; then
        echo "[!] Advertencia: '$pkg' no está instalado en tu sistema."
    else
        echo "[✓] '$pkg' encontrado."
    fi
done

echo "Creando directorios base..."
mkdir -p "$CONFIG_DIR/hypr"
mkdir -p "$CONFIG_DIR/mugen-shell"
mkdir -p "$CONFIG_DIR/hyde"
mkdir -p "$CONFIG_DIR/caelestia"

link_config() {
    local src="$1"
    local dest="$2"
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        rm -rf "$dest"
    fi
    ln -s "$src" "$dest"
    echo "Enlazado: $dest -> $src"
}

link_config "$DOTFILES_DIR/hypr" "$CONFIG_DIR/hypr"
link_config "$DOTFILES_DIR/mugen-shell" "$CONFIG_DIR/mugen-shell"
link_config "$DOTFILES_DIR/hyde" "$CONFIG_DIR/hyde"
link_config "$DOTFILES_DIR/caelestia" "$CONFIG_DIR/caelestia"

echo "=========================================="
echo "¡Todo armado y enlazado correctamente!"
echo "=========================================="
