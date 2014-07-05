#!/bin/sh

cd /sd

if [ -d target ]; then
rm -rf target
fi

cd ..
rm /sd

