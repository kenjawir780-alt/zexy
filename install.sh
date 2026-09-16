#!/data/data/com.termux/files/usr/bin/bash

set -e

echo "================================"
echo "       ZEXY TERMUX SETUP"
echo "================================"

echo "[1/4] Checking architecture..."

ARCH="$(uname -m)"

if [ "$ARCH" != "aarch64" ]; then
    echo "[!] Device bukan ARM64: $ARCH"
    exit 1
fi

echo "[✓] ARM64 detected"

echo
echo "[2/4] Updating Termux packages..."

pkg update -y

echo
echo "[3/4] Installing required packages..."

pkg install -y python clang make patchelf

echo
echo "[4/4] Checking ZEXY..."

if [ ! -f "./zexy" ]; then
    echo "[!] File zexy tidak ditemukan."
    echo "    Pastikan install.sh berada satu folder dengan zexy."
    exit 1
fi

chmod +x ./zexy

echo
echo "================================"
echo "       INSTALLATION DONE"
echo "================================"
echo
echo "Jalankan dengan:"
echo
echo "    ./zexy"
echo

read -r -p "Jalankan ZEXY sekarang? [y/N] " answer

case "$answer" in
    y|Y)
        echo
        ./zexy
        ;;
    *)
        echo
        echo "Oke. Jalankan nanti dengan: ./zexy"
        ;;
esac
