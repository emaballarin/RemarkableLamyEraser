#!/usr/bin/env bash

# Cleanup
rm -R -f ./build
rm -f RemarkableLamyEraser

# Source toolchain (adapt if different!)
unset LD_LIBRARY_PATH
. /opt/codex/rm11x/3.1.68/environment-setup-cortexa7hf-neon-remarkable-linux-gnueabi

# Create build directory (QT Creator does that automatically)
mkdir -p ./build

# qmake -> make
cd ./build
qmake ../RemarkableLamyEraser.pro

# make (# of threads tuned for WSL2@Windows11; remove the `/2` if running on bare-metal)
make -j$(($(nproc --all)/2))

# Copy artifact(s)
mv RemarkableLamyEraser ../
chmod +x ../RemarkableLamyEraser

# Cleanup
cd ../
rm -R -f ./build
