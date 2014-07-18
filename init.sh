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

if [ "$HELLO_ROOT" != '' ]; then
echo already running
exit
fi

export HELLO_ROOT=`get_path $0`
export HELLO_OUT=$HELLO_ROOT/buildroot-2014.05/output
export HELLO_PATH=$HELLO_OUT/host/usr/bin
export HELLO_TARGET=$HELLO_OUT/target
echo
echo ROOT: $HELLO_ROOT
echo

export PATH=$PATH:$HELLO_PATH

/bin/bash


