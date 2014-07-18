#!/bin/sh

pack=target
if [ "$1" = 'dev' ]; then pack=target-dev; fi

if [ ! -d $pack ]; then
mkdir $pack-tmp
tar jxvf ../dist/$pack.tar.bz2 -C $pack-tmp
mv $pack-tmp/target $pack
rmdir $pack-tmp
fi

rpath=/sd/$pack/lib:/sd/$pack/usr/lib

files=`find $pack`

for x in $files
do

if [ -d $x ];then continue; fi
if [ -h $x ];then continue; fi
is_elf=`file $x | grep ELF | wc -l`
if [ $is_elf -eq 0 ];then continue; fi
./patchelf --set-rpath $rpath --force-rpath $x

done

tar jcvf $pack-patch.tar.bz2 $pack/

