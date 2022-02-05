#! /bin/bash
# get the word from input
word=$(dmenu -p "Dictonary search: " <&-)
# exit if sting is empty
[ -z "$word" ] && exit 1
# to remove color output use per
~/.local/bin/cambrinary -w $word | perl -pe 's/\e\[?.*?[\@-~]//g' | dmenu -l 15
