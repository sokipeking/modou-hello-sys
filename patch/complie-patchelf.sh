#!/bin/bash

if [ ! -f patchelf-0.8.tar.gz ]; then
wget https://github.com/NixOS/patchelf/archive/0.8.tar.gz -O patchelf-0.8.tar.gz
fi

if [ -d patchelf-0.8 ]; then
rm -rf patchelf-0.8
fi

tar zxvf patchelf-0.8.tar.gz

source $HELLO_ROOT/gcc.sh 0
cd patchelf-0.8
./bootstrap.sh
./configure
make
cp src/patchelf ../
cd ..

rm -rf patchelf-0.8
