#!/bin/sh

clear
cd ~

systemctl stop LamyEraser.service 2 &>/dev/null
systemctl disable LamyEraser.service 2 &>/dev/null

echo "Downloading RemarkableLamyEraser Executable to /usr/sbin..."
cd /usr/sbin
rm -f RemarkableLamyEraser
wget https://github.com/emaballarin/RemarkableLamyEraser/raw/v1/RemarkableLamyEraser
echo "Adding execution privleges..."
chmod +x RemarkableLamyEraser
cd ~

read -p "Would you like RemarkableLamyEraser to start automatically on boot? [y/n]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Downloading service file to /lib/systemd/system..."
  cd /lib/systemd/system/
  rm -f LamyEraser.service
  wget https://github.com/emaballarin/RemarkableLamyEraser/raw/v1/LamyEraser.service
  read -p "Would you like to edit your configuration now? [y/n]" -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    nano LamyEraser.service
  fi
  echo "Setting up RemarkableLamyEraser to start on boot..."
  systemctl daemon-reload
  systemctl enable LamyEraser.service
  echo "Starting RemarkableLamyEraser. Enjoy!"
  systemctl start LamyEraser.service
else
  echo "You can start RemarkableLamyEraser at any time by running /usr/sbin/RemarkableLamyEraser"
  echo "Enjoy!"
fi
