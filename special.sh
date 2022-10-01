#!/bin/bash

#if [ $# -ne 1 ]; then
#	echo "usage: $0 Filename"
#	exit 1
#fi

#echo "parameter is $1"
#echo "my pid is $$"

echo "number of args is $#"
for arg in "$@"
do
	echo "argument $arg"
done

echo "trying to \$*"
for arg in "$*"
do
	echo "argument $arg"
done

echo "all param are $*" 
