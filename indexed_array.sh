#!/bin/bash

# 선언         			  | declare -a array_variable
# 선언+초기화  			  | array_variable=(abc, def, xyz)
# 값 추가      			  | array_variable+=(aaa)
# element삭제 			  | unset array_variable[1]
# key전체 목록 			  | ${!array_variable[@]}
# 전체 element 			  | ${array_variable[@]}
# n번째 element			  | ${array_variable[n]}
# element 개수 			  | ${#array_variable[@]}
# s번째 element 부터 n개의 element| ${array_variable[@]:s:n}
