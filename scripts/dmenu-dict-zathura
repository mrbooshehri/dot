#!/bin/bash
menu=$(dmenu -p "word:"<&-)
dict $menu |pandoc -o /tmp/dict.pdf
zathura /tmp/dict.pdf
