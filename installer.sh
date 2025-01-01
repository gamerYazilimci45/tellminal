#!/bin/bash

set -e

TELLMINAL="https://github.com/gamerYazilimci45/tellminal/raw/main/tellminal.py"
SERVER_PY="https://github.com/gamerYazilimci45/tellminal/raw/main/server.py"
CLIENT_PY="https://github.com/gamerYazilimci45/tellminal/raw/main/client.py"

DEST_DIR="/usr/bin"
DEST_DIR2="/usr/local/bin"


echo "Files are downloading and moving..."
for PY_FILE in "$SERVER_PY" "$CLIENT_PY"; do
    BASENAME=$(basename "$PY_FILE")
    echo "Downloading: $BASENAME"
    sudo wget -q -O "$DEST_DIR2/$BASENAME" "$PY_FILE"
    sudo chmod +x "$DEST_DIR2/$BASENAME"
done

BASENAME=$(basename "$TELLMINAL")
echo "Downloading: $BASENAME"
sudo wget -q -O "$DEST_DIR/$BASENAME" "$TELLMINAL"
sudo chmod +x "$DEST_DIR/$BASENAME"

echo "[+] tellminal is successfully installed!"