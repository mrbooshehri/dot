#! /usr/bin/env	bash
# Varaibles
dir_conf=~/.config/firefox-helper
file_bookmarks=$dir_conf/firefox-bookmarks
regex='((https?|ftp|file)://)?(www.)?[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'

# Check conf folder and bookmark
mkdir -p $dir_conf
test -f $file_bookmarks || touch file_bookmarks

# Sort bookmarks file
printf "%s\n" "$(sort $file_bookmarks)" > $file_bookmarks

# Get input
input=$(dmenu -p "Go: " -l 5 < $file_bookmarks)
# If process is canceled 
[ -z "$input" ] && exit 1
# Check input if it's url or not

if [[ $input =~ "." ]]
then
  if [[ $(echo $input | wc -w) == 1 ]]
  then
    # Add url if it does not exist in bookmark file
      grep "$input" $file_bookmarks > /dev/null ||  echo "$input" >> "$file_bookmarks"
      firefox "$input"
  fi
else
  firefox "https://searx.bar/search?q=$input"
fi
