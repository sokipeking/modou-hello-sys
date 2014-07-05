#!/bin/sh

get_path()
{
	this_dir=`pwd`
	dirname $1|grep "^/" >/dev/null
	if [ $? -eq 0 ];then
	                this_dir=`dirname $1`
	else
	        dirname $1|grep "^\." >/dev/null
	        retval=$?
	        if [ $retval -eq 0 ];then
	                        this_dir=`dirname $1|sed "s#^.#$this_dir#"`
	        else
	                   this_dir=`dirname $1|sed "s#^#$this_dir/#"`
	        fi
	fi  
	echo $this_dir;
	return 0;
}
output=`get_path "$0"`
echo $output
output=`get_path "$output/../buildroot-2014.05/output/foo.bar"`
echo $output
PATH=$PATH:$output/host/usr/bin

include_path=$output/host/usr/include
include_path=$include_path:$output/host/usr/lib/gcc/mipsel-buildroot-linux-uclibc/4.7.3/include
include_path=$include_path:$output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/include/

lib_path=$output/host/usr/lib
lib_path=$lib_path:$output/host/usr/libexec/gcc/mipsel-buildroot-linux-uclibc/4.7.3
lib_path=$lib_path:$output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib
lib_path=$lib_path:$output/host/usr/mipsel-buildroot-linux-uclibc/lib/

C_INCLUDE_PATH=$include_path
CPLUS_INCLUDE_PATH=$include_path

LIBRARY_PATH=$lib_path


CC=mipsel-linux-gcc
CXX=mipsel-linux-g++
AR=mipsel-linux-ar
RANLIB=mipsel-linux-ranlib

$CC main.c -o bin.ct
$CXX main.cc -o bin.cc
