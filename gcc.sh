#!/bin/sh

if [ "$1" = '1' ]; then 

include_path=$HELLO_OUT/host/usr/include
include_path=$include_path:$HELLO_OUT/host/usr/lib/gcc/mipsel-buildroot-linux-uclibc/4.7.3/include
include_path=$include_path:$HELLO_OUT/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/include/

lib_path=$HELLO_OUT/host/usr/lib
lib_path=$lib_path:$HELLO_OUT/host/usr/libexec/gcc/mipsel-buildroot-linux-uclibc/4.7.3
lib_path=$lib_path:$HELLO_OUT/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib
lib_path=$lib_path:$HELLO_OUT/host/usr/mipsel-buildroot-linux-uclibc/lib/

export C_INCLUDE_PATH=$include_path
export CPLUS_INCLUDE_PATH=$include_path

export LIBRARY_PATH=$lib_path


export CC=mipsel-linux-gcc
export CXX=mipsel-linux-g++
export AR=mipsel-linux-ar
export RANLIB=mipsel-linux-ranlib

unset include_path lib_path

echo mips-gcc: enable

else
unset C_INCLUDE_PATH CPLUS_INCLUDE_PATH LIBRARY_PATH
unset CC CXX AR RANLIB
echo mips-gcc: disable
fi
