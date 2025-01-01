#!/bin/bash

set -e

TELLMINAL="https://github.com/gamerYazilimci45/tellminal/raw/main/tellminal.py"
SERVER_PY="https://github.com/gamerYazilimci45/tellminal/raw/main/server.py"
CLIENT_PY="https://github.com/gamerYazilimci45/tellminal/raw/main/client.py"

DEST_DIR="/usr/local/bin"
TELLMINAL_NAME="tellminal"

echo "Files are downloading and moving..."
for PY_FILE in "$SERVER_PY" "$CLIENT_PY"; do
    BASENAME=$(basename "$PY_FILE")
    echo "Downloading: $BASENAME"
    sudo wget -q -O "$DEST_DIR/$BASENAME" "$PY_FILE"
    sudo chmod +x "$DEST_DIR/$BASENAME"
done

BASENAME=$(basename "$TELLMINAL")
echo "Downloading: $BASENAME"
sudo wget -q -O "$DEST_DIR/$TELLMINAL_NAME" "$TELLMINAL"
sudo chmod +x "$DEST_DIR/$TELLMINAL_NAME"

echo "[+] tellminal is successfully installed!"