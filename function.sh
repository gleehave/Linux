#!/bin/bash

#function test1()
#{
#	echo "hello. this is test1 function."
#}

#function test2
#{
#	echo "hello. this is test2 function."
#}

#test3()
#{
#	echo "hello. this is test3 function"
#}

#echo "start..."
#test1
#test2
#test3

function test1()
{
	if [ -z "$1" ]; then
		echo "param1 is missing"
	fi
	if [ -z "$2" ]; then
		echo "param2 is missing"
	fi

	# local keyword를 사용하면, 함수안에서만 사용된다.
	# local keyword는 함수에서만 사용할 수 있다.
	local target="${1}"
	local action="${2}"
	
	echo "this is test1"
	echo "first param is ${target}"
	echo "second param is ${action}"
	
	return 0
	# return 은 0~255 까지만 가능.
	# return "aaaaa" 하면 error 숫자를 return 해야 함..
}

# parameter를 넘겨준다.

result=$(test1 "Hello" "world") # echo의 출력문을 결과값으로 받을 수 있다.

if [ "$result" -eq 0 ]; then
	echo "sucess"
else
	echo "fail"
fi

echo "test1 returns \"$result\""

