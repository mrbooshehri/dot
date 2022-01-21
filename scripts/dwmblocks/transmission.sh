#! /bin/bash

TORRENT=$(transmission-remote -l | sed '2q;d' | sed 's/\(.\) /\1/g')
ID=$(printf "%s" "$TORRENT" | awk '{print $1;}')
STATUS=$(printf "%s" "$TORRENT" | awk '{print $8;}')
ETA=$(printf "%s" "$TORRENT" | awk '{print $4;}')
NAME=$(printf "%s" "$TORRENT" | awk '{for(i=9;i<=NF;++i)print $i}' | tr -d "\n" | head -c 20; printf "...")
DONE=$(printf "%s" "$TORRENT" | awk '{print $2;}')
UP=$(printf "%s" "$TORRENT" | awk '{print $5;}')
DOWN=$(printf "%s" "$TORRENT" | awk '{print $5;}')

if [ "$ID" != "Sum:" ]; then
        case "$STATUS" in
            "Idle")
                printf "🛑 %s | %s %s ⬆%s ⬇%s" "$NAME" "$DONE" "$ETA" "$UP" "$DOWN"
                ;;
            "Seeding")
                printf "🌱 %s | ⬆%s ⬇%s" "$NAME" "$UP" "$DOWN"
                ;;
            "Downloading")
                printf "⏬ %s | %s %s ⬆%s ⬇%s" "$NAME" "$DONE" "$ETA" "$UP" "$DOWN"
                ;;
        esac
fi

