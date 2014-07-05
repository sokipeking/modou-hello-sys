#!/bin/sh

sd=/sd
udisk=/media/sda1

url=http://app.ydjiao.com
matrix=matrix

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

if [ ! -f target.tar.bz2 ]; then
wget $url/target.tar.bz2 -O target.tar.bz2
fi

if [ ! -d target ]; then
tar jxvf target.tar.bz2
bin/chown -R $matrix target
bin/chgrp -R $matrix target
fi

HOME=/root

bin/chroot target /bin/sh /init.sh 

echo
echo -- welcome back to modou route --
echo

