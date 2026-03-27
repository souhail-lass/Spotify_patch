#!/bin/bash

# 1. Install Spicetify-CLI for Mac (The Engine)
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh

# 2. Setup Paths
EXT_DIR="$HOME/.config/spicetify/Extensions"
mkdir -p "$EXT_DIR"

# 3. Download YOUR files from GitHub
# Note: Using the raw links to your Spot_patch folder
curl -fsSL "https://raw.githubusercontent.com/souhail-lass/Spotify_patch/main/Spot_patch/patch.js" -o "$EXT_DIR/patch.js"
curl -fsSL "https://raw.githubusercontent.com/souhail-lass/Spotify_patch/main/Spot_patch/win_sync.py" -o "$EXT_DIR/win_sync.py"

# 4. Enable and Apply the logic
# We use the full path to the spicetify binary installed by the script above
~/.spicetify/spicetify config extensions patch.js
~/.spicetify/spicetify apply
