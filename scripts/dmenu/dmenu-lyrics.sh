#!/bin/bash

basename=lyrics
file_tmp_txt=/tmp/$basename.txt
file_tmp_pdf=/tmp/$basename.pdf

query=$(dmenu -p "Lyrics search: " <&-)
echo -e "# $query\n\n" > $file_tmp_txt

~/scripts/general/google-lyric.sh "$query" >> $file_tmp_txt
sed -i 's/$/  /' $file_tmp_txt
pandoc -V geometry:margin=1in $file_tmp_txt -o $file_tmp_pdf
zathura $file_tmp_pdf
