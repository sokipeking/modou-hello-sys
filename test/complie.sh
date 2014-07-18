#!/bin/bash

source $HELLO_ROOT/gcc.sh 1

$CC main.c -o bin.c
$CXX main.cc -o bin.cc

source $HELLO_ROOT/gcc.sh 0


