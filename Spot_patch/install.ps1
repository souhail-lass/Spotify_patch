# 1. Install Spicetify-CLI (Standard 2026 Engine)
iwr -useb https://raw.githubusercontent.com/spicetify/cli/main/install.ps1 | iex

# 2. Setup Paths for the Extensions
$extFolder = "$env:APPDATA\spicetify\Extensions"
if (!(Test-Path $extFolder)) { mkdir $extFolder }

# 3. Download YOUR files from the 'Spot_patch' folder
# We use the 'raw' link so PowerShell can read the code directly
iwr -useb "https://raw.githubusercontent.com/souhail-lass/Spotify_patch/main/Spot_patch/patch.js" -o "$extFolder\patch.js"
iwr -useb "https://raw.githubusercontent.com/souhail-lass/Spotify_patch/main/Spot_patch/win_sync.py" -o "$extFolder\win_sync.py"

# 4. Enable the Extension and Restart Spotify
spicetify config extensions patch.js
spicetify backup apply
