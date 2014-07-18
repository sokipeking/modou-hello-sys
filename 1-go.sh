#!/bin/sh

tar zxvf src/buildroot-2014.05.tar.gz
cd buildroot-2014.05

cp ../large.config .config
cp -R ../src/dl ./

#make --help
#make menuconfig
#make all

