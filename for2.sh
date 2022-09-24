#!/bin/bash

for index in {0..10..3}
do
	echo "index is $index"
done

for ((index=0; index<10; index++))
do
	echo "C style | index is $index"
done

a=100
echo "a is $a"

let 'a=a+20'
echo "a is $a"

((a+=100))
echo "a is $a"
