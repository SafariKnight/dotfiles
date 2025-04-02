#!/usr/bin/env bash

TMP=$(mktemp -d)
RELEASE_URL=$(curl -s https://api.github.com/repos/tomasklaen/uosc/releases/latest | jq -r '.assets[] | select(.name | endswith(".zip")) | .browser_download_url')
CONFIG_URL=$(curl -s https://api.github.com/repos/tomasklaen/uosc/releases/latest | jq -r '.assets[] | select(.name | endswith(".conf")) | .browser_download_url')

if [[ -z "$RELEASE_URL" || -z "$CONFIG_URL" ]]; then
    echo "Error: Could not find either uosc.zip or uosc.conf in the latest release."
    exit 1
fi

RELEASE_PATH=$TMP/uosc.zip
CONFIG_PATH=$TMP/uosc.conf

echo "Downloading uosc.zip from: $RELEASE_URL"
wget "$RELEASE_URL" -O "$RELEASE_PATH"
unzip "$RELEASE_PATH" -d "$TMP"
rm -rf "$RELEASE_PATH"
mv "$TMP/fonts" ~/.config/mpv
mv "$TMP/scripts" ~/.config/mpv


echo "Downloading uosc.conf from: $CONFIG_URL"
curl -L -o "$CONFIG_PATH" "$CONFIG_URL"
mkdir -p ~/.config/mpv/script-opts
mv "$CONFIG_PATH" ~/.config/mpv/script-opts/
