#!/bin/bash

# $#은 파라미터의 개수
echo "number of args is $#"
echo "\$1 is $1"
echo "\$2 is $2"
echo "\$3 is $3"

# shift를 사용하면 입력받은 parameter를 먹어치운다.

while [ "$#" -gt 0 ]
do
	echo "argument $1"
	shift
done

echo "number of args is $#"
