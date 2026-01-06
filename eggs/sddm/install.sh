#!/bin/bash
set -e

THEME_REPO="https://github.com/catppuccin/sddm.git"
THEME_DEST="/usr/share/sddm/themes"
CONF_DEST="/usr/lib/sddm/sddm.conf.d"

echo "Setting up SDDM theme..."

# Create temp dir
TMP_DIR=$(mktemp -d)

# Clone repo
if git clone --depth 1 "$THEME_REPO" "$TMP_DIR/sddm-theme"; then
    echo "Repo cloned."
else
    echo "Failed to clone repo."
    rm -rf "$TMP_DIR"
    exit 1
fi

# Install theme files
if [ -d "$TMP_DIR/sddm-theme/src" ]; then
    echo "Installing theme files to $THEME_DEST..."
    sudo mkdir -p "$THEME_DEST"
    sudo cp -rn "$TMP_DIR/sddm-theme/src/"* "$THEME_DEST/" || echo "Some themes might already exist, skipping duplicates."
else
    echo "Error: 'src' directory not found in cloned repo."
fi

# Install config
if [ -f "eggs/sddm/default.conf" ]; then
    echo "Installing sddm config to $CONF_DEST..."
    sudo mkdir -p "$CONF_DEST"
    sudo cp "eggs/sddm/default.conf" "$CONF_DEST/default.conf"
else
    echo "Error: eggs/sddm/default.conf not found."
fi

# Cleanup
rm -rf "$TMP_DIR"
echo "Done."
