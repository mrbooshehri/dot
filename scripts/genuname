#!/bin/bash

dir_conf=$HOME/.config/genuname 
mkdir -p $dir_conf 

if [ ! -f "$dir_conf/usernames.txt" ]; then
  echo "Getting usernames list:"
  sleep 1
  wget -O "$dir_conf/usernames.txt" "https://raw.githubusercontent.com/mrbooshehri/scripts/master/bash/usernames.txt"
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
fi

username=$(shuf "$dir_conf/usernames.txt" | head -1)
number=$((1 + $RANDOM % 1000)) 

case $1 in
  "") echo ${username} ;;
  "-n") echo "${username}${number}" ;;
  "-sn") echo "${username}${number}" ;;
  "-h") echo "Simple username generator"
  	echo  -e "-h\thelp"
    	echo  -e "-n\tUsername with a random number at the end"
  	echo  -e "-sn\tUsername with a random number at the end separated with an underline"
    ;;
  *) echo "Error: Invalid argument."
    exit 1
    ;;
esac
