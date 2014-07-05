#!/bin/sh

pack=target
if [ "$1" == 'dev' ]; then pack=target-dev; fi

cd /sd

if [ -d $pack ]; then
rm -rf $pack
fi

cd ..
rm /sd

