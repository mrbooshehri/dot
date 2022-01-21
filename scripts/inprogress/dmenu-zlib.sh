#!/bin/bash

base_url=https://1lib.net
dir_tmp=/tmp/zlibdl
file_tmp=$dir_tmp/tmp.txt
file_links=$dir_tmp/link.txt
file_names=$dir_tmp/names.txt
file_download_page=$dir_tmp/download_page.txt
mkdir -p $dir_tmp

query=$(dmenu -p "Book's title: " <&-)

curl -s4 $base_url/s/$query | pup '.resItemTable' | pup 'h3[itemprop="name"]' | pup 'a' > $file_tmp

grep 'href=".*" ' $file_tmp | awk '{print $2}' | awk -F '"' 'BEGIN{i=1} /.*/ {print i,$2;i++}' > $file_links
awk 'BEGIN{i=1} /^ / {print i,$0;i++}' $file_tmp > $file_names

choice=$(cat $file_names | dmenu -l 25 | awk '{print $1}')
echo $choice
download_page=$base_url$(sed "$choice!d" $file_links | cut -d " " -f 2)
echo $download_page
download_link=$base_url$(curl -s4 $download_page | pup '.dlButton' | grep 'href=' | awk '{print $6}' | awk -F '"' '{print $2}')
echo $download_link


