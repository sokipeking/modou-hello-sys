#!/bin/sh

sd=/sd
udisk=/media/sda1

url=http://app.ydjiao.com
matrix=matrix
pack=target
if [ "$1" == 'dev' ]; then pack=target-dev; fi

if [ ! -h /sd ]; then ln -s "$udisk" "/sd"; fi
cd "/sd"

if [ ! -d bin ]; then mkdir bin; fi
cd bin

if [ ! -f busybox ]; then
wget $url/busybox -O busybox
ln -s busybox chroot
ln -s busybox chown
ln -s busybox chgrp
chmod 755 chroot
fi
cd ..

if [ ! -f del.sh ]; then
wget $url/del.sh -O del.sh
fi

if [ ! -f $pack.tar.bz2 ]; then
wget $url/$pack.tar.bz2 -O $pack.tar.bz2
fi

if [ ! -d $pack ]; then
mkdir $pack-tmp
tar jxvf $pack.tar.bz2 -C $pack-tmp
mv $pack-tmp/target $pack
rmdir $pack-tmp
bin/chown -R $matrix $pack
bin/chgrp -R $matrix $pack
fi

HOME=/root

bin/chroot $pack /bin/sh /init.sh 

echo
echo -- welcome back to modou route --
echo

