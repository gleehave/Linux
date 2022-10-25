# Linux
- 간단한 Linux 명령어만 정리한다.
- shell script 환경에서 익숙해지려는 목적을 갖고, 당황스러움을 극복한다.

## Shell Script
#### Shebang
- Shebang이 있는 스크립트는 프로그램으로 실행되면, 프로그램 Loader가 스크립트의 첫 줄 부분을 인터프리터 지시자로 구문을 분석한다.
```
#!/bin/bash
#!/bin/csh
#!/bin/zsh

echo $(which zsh)
/opt/homebrew/bin/zsh
```

#### 변수선언
- "로컬변수"와 "환경변수(전역)"이 존재한다.
- 값을 사용할 때는 변수명 앞에 특수문자 "$"를 사용한다. (e.g., echo ${data})
- 값을 대입할 때는 특수문자 "$"를 사용하지 않는다. (e.g., data=mac)

**환경변수**
```
$0 : 실행된 쉘 스크립트 파일명
$# : 스크립트에 전달된 인자의 개수
$$ : 쉘 스크립트의 PID
```
- $1, $2, $3, $n ... : 넘겨진 인자의 값
- $* 또는 $@ : 전달된 인자들을 모아놓은 문자열
```
#!/bin/bash

echo "Args 1: $1"
echo "Args 2: $2"
echo "Args 3: $3"

echo "Args List \$@: $@"
echo "Args List \$*: $*"
```

#### 산술연산
```
#!/bin/bash

number1 = 10
number2 = 20

plus = `expr $number1 + $number2`
minus = `expr $number1 - $number2`
mul = `expr $number1 \* $number2`
div = `expr $number1 / $number2`
rem = `expr $number2 % $number2`

echo "plus: ${plus}"
echo "minus: ${minus}"
echo "mul: ${mul}"
echo "div: ${div}"
echo "rem: ${rem}"
```

#### 조건문
- if문 뒤에 나오는 [ ] 사이에는 공백이 존재해야한다.
```
if [ 값1 조건식 값2 ]; then
    수행
fi
```
```
#!/bin/bash
num1 = 10
num2 = 10

if [ ${num1} -eq ${num2} ]; then
    echo "변수의 값이 같습니다."
fi
```
```
[ -z ${변수} ]  # 변수의 문자열 길이가 0이면 True
[ -n ${변수} ]  # 변수의 문자열 길이가 0이 아니면 True
[ ${변수1} -eq ${변수2} ]  # 변수1과 변수2의 값이 같으면 True
[ ${변수1} -ne ${변수2} ]  # 변수1과 변수2의 값이 다르면 True
[ ${변수1} -gt ${변수2} ]  # 변수1의 값이 변수2의 값 보다 크면 True
[ ${변수1} -ge ${변수2} ]  # 변수1의 값이 변수2의 값 보다 크거나 같으면 True
[ ${변수1} -lt ${변수2} ]  # 변수1의 값이 변수2의 값 보다 작으면 True
[ ${변수1} -le ${변수2} ]  # 변수1의 값이 변수2의 값 보다 작거나 같으면 True

[ 조건A -a 조건B ]  #조건식 A와 B 모두가 참이면 Ture (&& 연산)
[ 조건A -o 조건B ]  #조건식 A와 B 둘 중 1개만 참이라면 Ture (|| 연산)

[ -d ${A} ] # A파일이 폴더이면 True
[ -e ${A} ] # A파일이 존재하면 True
[ -L ${A} ] # A파일이 심볼릭 링크로 되어 있으면 True
[ -r ${A} ] # A파일이 읽기가 가능하면 True
[ -w ${A} ] # A파일이 쓰기가 가능하면 True
[ -x ${A} ] # A파일이 실행이 가능하면 True
[ -s ${A} ] # A파일이 크기가 0보다 크면 True
```

#### 반복문
```
#!/bin/bash
for 변수 in 범위
do
    수행로직
done
```
```
#!/bin/bash
data= "1 2 3 4"
for ((i=1; i<=4; i++)); do
    echo $i
done

for x in $data
do
    echo ${x}
done

for x in $(seq 4)
do
    echo ${x}
done

datas=(1 2 3 4)
for x in $datas
do
    echo ${x}
done
```

## File System Command
#### ls -al: 숨김 파일(hidden file)도 포함한 상세 목록 나열하기
#### pwd: 현재 작업 폴더(Directory) 보여주기
#### mkdir: 새로운 폴더(Directory)를 만듦.
#### rm file: 지정 파일(file) 삭제
#### rm -r dir: 지정 폴더 삭제
#### rm -f file: 지정 파일 삭제
#### rm -rf dir: 지정 폴더 강제 삭제
#### cp file1 file2: 파일1을 파일2로 복사하기
#### cp -r dir1 dir2: 폴더1을 폴더2로 복사하기
#### mv file1 file2: 파일1에서 파일2로 이동; 이름변경(만약 파일2가 존재한다면, 파일1은 파일2로 이동)
#### ln -s file link: 파일에 연결되는 심볼릭 링크(symbolic link)를 생성
#### touch file: 파일 생성 또는 갱신
#### cat > file: 표준입력(키보드 입력)을 지정 파일로 저장함.
#### more file: 지정 파일 내용을 화면에 출력함.
#### head file: 지정 파일의 첫 10줄을 화면 출력함.
#### tail file: 지정 파일의 끝 10줄을 화면 출력함.
#### tail -f file: 지정 file끝 10줄부터 10줄씩 계속 화면 출력함. 종료명령은 Ctrl+C
#### rmdir
- remove directory의 약자
- 빈 디렉토리를 삭제할 때 사용함.
    - 삭제하려는 디렉토리가 비어있지 않을 경우에는 삭제할 수 없다.

## Process Management
#### ps: 현재 실행중인 프로세스(process) 정보 출력
#### top: 현재 실행중인 프로세스 세부 정보 출력
<img width="1439" alt="스크린샷 2022-10-25 오후 8 23 27" src="https://user-images.githubusercontent.com/91510831/197760339-a9177d77-eb0a-4dbd-8f57-019125ec8bce.png">

#### kill pid: 지정 pid를 가진 프로세스 종료(kill)하기
#### killall proc: 프로세스 이름이 proc 인 모든 프로세스 종료하기
#### bg: 중지된(stopped) 또는 백그라운드 잡(background job) 목록 나열. 백그라운드 내 중지된 잡(stopped job)을 재시작함.
#### fg: 가장 최근 잡(job)을 포어그라운드(foreground)로 보냄.
#### fg n: 가장 최근 잡(job) n을 포어그라운드로 보냄.

## File Permissions
#### chmod octal file: 지정된 8진수 값(octal)으로 지정된 file의 접근권한(permissions)을 변경함.
    - 4: read(r)
    - 2: write(w)
    - 1: execute(x)
        chmod 777 : 모든 사용자에게 read, write, execute 허용
        chmod 755 : 사용자는 rws 권한, 사용자 그룹 및 기타사용자는 rx권한 부여됨.
        
## SSH(Secure SHELL)
#### ssh user@host: 지정된 호스트(host)에 사용자명 user로 접속함
#### ssh -p port user@host: 지정된 호스트(host)의 지정 포트(port)로 사용자명 user로 접속함.
#### ssh-copy-id user@host: 지정된 호스트(host)에 사용자명 user로 키입력 또는 암호입력 없는(passwordless) 로그인을 위한 사용자키(your key)추가하기.

## Searching
#### grep pattern files: 지정 파일(files) 내에서 지정 패턴(pattern) 찾기
<img width="601" alt="스크린샷 2022-10-25 오후 8 26 03" src="https://user-images.githubusercontent.com/91510831/197760786-ac831d39-d2f4-41bc-926f-ec8cef8ff5b9.png">

#### grep -r pattern dir: 지정 폴더(directory) 내에서 반복적으로 지정 패턴(pattern) 찾기
#### command | grep pattern: 지정 명령어(command) 출력에서 지정 패턴(pattern) 찾기
#### locate file: 지정 파일의 모든 인스턴스(instances) 찾기

## System Info
#### date: 현재 시스템 날짜 및 시간 정보 출력
#### cal: 현재 월 달력 출력
#### uptime: 현재 시스템 가동시간(uptime)출력
#### w: 현재 온라인 상태인 사용자 목록 출력
#### whoami: 현재 로그인된 사용자 정보 출력
#### finger user: 사용자에 관한 정보 출력
#### uname -a: 커널(kernel)정보 출력
#### cat/proc/cpuinfo: cpu 정보 출력
#### cat/proc/meminfo: 메인 memory 정보 출력
#### man command: 특정 명령어에 대한 매뉴얼 출력
#### df 디스크 사용량 출력
#### du: 폴더 공간 사용량 출력
#### free: 메인 메모리 및 스왑(swap)영역 사용량 출력
#### whereis app: 지정된 애플리케이션(app)의 위치 경로 출력
#### which app: 디폴트로 지정된 애플리케이션(app)의 위치 경로 출력

## Compression
#### tar cf file.tar files: 지정된 파일들을 file.tar 라는 이름으로 압축
#### tar xf file.tar: 지정된 압축파일(file.tar) 내 파일들의 압축풀기
#### tar czf file.tar.gz files: Gzip 압축방식으로 file.tar.gz 압축
#### tar xzf file.tar.gz: Gzip 방식으로 압축 풀기
#### tar cjf file.tar.bz2: Bzip2 압축방식으로 압축
#### tar xjf file.tar.bz2: Bzip2 압축방식으로 압축풀기
#### gzip file: 지정 파일을 압축하고, file.gz 생성
#### gzip -d file.gz: file.gz의 압축풀고 원본 파일로 되돌림

## Network
#### ping host: 지정호스트(host)에 대해 핑(ping)결과 출력
#### whois domain: 지정 도메인(domain)에 대한 whois 정보 출력
#### dig domain: 지정 도메인(domain)에 대한 DNS 정보 출력
#### dig -x host: 지정 호스트에 대한 reverse lookup 출력
#### wget file: 지정파일 다운로드
#### wget -c file: 중지된 다운로드 다시 시작함
#### iptables: 시스템 관리자가 특정 호스트 시스템에 들어오고 나가는 인터넷 트래픽을 제어할 수 있는 터미널 유틸리티를 제공.
#### traceroute: 네트워크 패킷이 하나의 시스템에서 다른 시스템으로 이동하는 경로를 결정할 수 있게 해주는 명령어.
