#!/data/data/com.termux/files/usr/bin/bash

set -e

echo "================================"
echo "       ZEXY TERMUX SETUP"
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

# Runtime utilities yang umum diperlukan
pkg install -y coreutils

echo
echo "[3/3] Checking ZEXY..."

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