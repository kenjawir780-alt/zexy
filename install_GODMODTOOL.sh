#!/data/data/com.termux/files/usr/bin/bash

set -e

echo "================================"
echo "    GODMODTOOL TERMUX SETUP"
echo "================================"

echo
echo "[1/3] Checking architecture..."

ARCH="$(uname -m)"

if [ "$ARCH" != "aarch64" ]; then
    echo "[!] Device bukan ARM64: $ARCH"
    exit 1
fi

echo "[✓] ARM64 detected"

echo
echo "[2/3] Preparing Termux..."

pkg update -y
pkg install -y coreutils curl

echo
echo "[3/3] Checking GODMODTOOL..."

if [ ! -f "./GODMODTOOL" ]; then
    echo "[!] File ZEXY tidak ditemukan."
    echo "    Pastikan install.sh berada satu folder dengan GODMODTOOL."
    exit 1
fi

chmod +x ./GODMODTOOL

echo
echo "================================"
echo "       INSTALLATION DONE"
echo "================================"

echo
echo "Jalankan dengan:"
echo
echo "    ./GODMODTOOL"
echo

read -r -p "Jalankan GODMODTOOL sekarang? [y/N] " answer

case "$answer" in
    y|Y)
        echo
        ./GODMODTOOL
        ;;
    *)
        echo
        echo "Oke. Jalankan nanti dengan: ./GODMODTOOL"
        ;;
esac