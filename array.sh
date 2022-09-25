#!/bin/bash

# elements는 띄워쓰기(space)로 구분한다.

#declare -a ARRAY
#ARRAY+=(hello world there 1234)

ARRAY=(hello world there 1234)

echo "number of elements is  ${#ARRAY[@]}"
for arr in "${ARRAY[@]}"
do
	echo "array element \"$arr\""
done

echo "2nd element: ${ARRAY[2]}"

unset ARRAY[1]

# !를 붙혀서 key를 받아온다.
for key in "${!ARRAY[@]}"
do
	echo "key \"$key\" -> ${ARRAY[$key]}"
done





