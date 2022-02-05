#! /usr/bin/env bash

dir_tmp=/tmp
file_tmp="$dir_tmp"/quotes
url=https://www.brainyquote.com/topics/random-quotes

curl -s4 "$url" | pup '#quotesList a' | pup '.oncl_q' | sed -E "/<.*>/d;s/&#39;/\'/g" | shuf | head -5 > "$file_tmp"

# for kitty you have to copy 'mitype' binary to /usr/bin/
kitty mitype -f $file_tmp
