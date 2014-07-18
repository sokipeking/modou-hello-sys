#!/bin/sh

cp src/buildroot-2014.05/package/Makefile.in buildroot-2014.05/package/Makefile.in

patch buildroot-2014.05/package/Makefile.in < m.patch

cd buildroot-2014.05/output/build/busybox-1.22.1/
make clean
cd ../../..
make busybox-rebuild

cd .. 
mipsel-linux-readelf -d buildroot-2014.05/output/build/busybox-1.22.1/busybox

