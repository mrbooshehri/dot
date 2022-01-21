#! /bin/bash

# variable 
API_KEY=563492ad6f9170000100000154e43e04e01a48aa814d62838bc1abd9
QUERY=people

DIR_HOME=/tmp/pexele

# directories
mkdir -p $DIR_HOME

# search by query
wget -qnc $DIR_HOME $(curl -H "Authorization: $API_KEY" "https://api.pexels.com/v1/search?query=$QUERY" | jq --raw-output '.photos[].src.original' )

# static requests

wget -qnc $DIR_HOME $(curl -H "Authorization: $API_KEY" "https://api.pexels.com/v1/curated?page=1&per_page=50" | jq --raw-output '.photos[].src.original' )

# my collectiosn
wget -qnc $DIR_HOME $(curl -H "Authorization: $API_KEY" "https://api.pexels.com/v1/collections" | jq --raw-output '.photos[].src.original' )

# feacure collectiosn
wget -qnc $DIR_HOME $(curl -H "Authorization: $API_KEY" "https://api.pexels.com/v1/collections/featured?per_page=1" | jq --raw-output '.collections[] | {id:.id, title:.title, count:.photos_count}' )

