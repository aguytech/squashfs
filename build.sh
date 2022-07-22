#!/bin/sh

! hash apt 2>/dev/null && echo "This installation is for Ubuntu OS" && exit 1

echo "> Create temporary folder"
path=/tmp/squashfs.$[date +%s)
mkdir ${path} || { echo "Unable to create path; ${path}" && exit 1; }
cd ${path}

echo "> installs required packages"
echo
sudo apt install -y build-essential liblzma-dev liblzo2-dev zlib1g-dev || { echo; echo "Unable to continue without packages installed"; exit 1; }

path=$( dirname $( readlink -f $0 ) )/squashfs4.3
cd ${path} || { echo; echo "Unable find path ${path}"; exit 1; }

CFLAGS=-fcommon make || exit 1
sudo make install || exit 1

echo
echo "> Installation succeded"

