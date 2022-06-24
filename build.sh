#!/bin/sh

! hash apt 2>/dev/null && echo "Unable to find apt" && exit 1

echo "> install required packages"
echo
sudo apt install -y build-essential liblzma-dev liblzo2-dev zlib1g-dev

cd $(dirname $(readlink -f $0))/squash

CFLAGS=-fcommon make || exit 1
sudo make install || exit 1

echo
echo "> Installation succeded"
