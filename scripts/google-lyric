#!/usr/bin/env sh

#### Dependences
# pup
# recode

snipcall() {
    com="$(echo "$google_html" | eval "$@")"
    [ -n "$com" ] && output "$com" && exit 0
}

output() { 
    printf "%s" "$*"
}

query="$*"

user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:53.0) Gecko/20100101 Firefox/53.0"
google_url="https://www.google.com/search?hl=en_US"
google_html=$(curl -Gs --compressed "$google_url" --user-agent "$user_agent" --data-urlencode "q=$query")

snipcall "pup 'div.bbVIQb text{}' | recode html..ISO-8859-1"
snipcall "pup 'span[jsname=\"YS01Ge\"] text{}' | recode html..ISO-8859-1"

