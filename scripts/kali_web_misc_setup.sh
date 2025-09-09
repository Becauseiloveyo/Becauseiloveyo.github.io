#!/usr/bin/env bash
set -e

echo "[*] Updating apt and installing tools..."
sudo apt update

sudo apt install -y \
  git curl jq python3 python3-pip python3-venv \
  exiftool binwalk foremost steghide pngcheck qpdf \
  tshark zbar-tools ffmpeg imagemagick p7zip-full \
  seclists wordlists dirb \
  burpsuite sqlmap feroxbuster ffuf \
  ruby-full

# rockyou dictionary
if [ -f /usr/share/wordlists/rockyou.txt.gz ]; then
  sudo gzip -d -f /usr/share/wordlists/rockyou.txt.gz || true
fi

echo "[*] Upgrading pip and setting up pipx..."
python3 -m pip install --upgrade pip pipx
pipx ensurepath

echo "[*] Installing zsteg (Ruby)..."
sudo gem install zsteg

echo "[*] Optional: allow non-root capture with tshark"
echo "    Run: sudo dpkg-reconfigure wireshark-common (choose Yes)"
echo "    Then: sudo usermod -aG wireshark $USER && re-login"

echo "[*] Done. Launch Burp (burpsuite) and set browser proxy to 127.0.0.1:8080."