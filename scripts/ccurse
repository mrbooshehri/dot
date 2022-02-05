#! /bin/bash

APTSFILE="$HOME/.calcurse/apts"
APPOINTMENT=$(head -n 1 "$APTSFILE" | sed -r 's/\[1\] //')

if [ "$APPOINTMENT" != "" ]; then
        printf "💡 %s" "$APPOINTMENT"
fi

