#! /bin/bash
man $( find /usr/share/man/man1 -type f | awk -F '/' '{print $NF}' | sed 's/.1.*.gz//g' | fzf)
