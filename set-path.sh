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
output=`get_path a`
output=$output/buildroot-2014.05/output/host/usr/bin
#echo $output
echo export PATH=$PATH:$output
