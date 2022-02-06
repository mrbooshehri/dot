#! /usr/bin/env bash
gnr=()
gnr+=("Lofi")
gnr+=("Ocean")
gnr+=("Piano")
gnr+=("Rain")
gnr+=("Rap")
gnr+=("Relaxing")
gnr+=("Tibetian Bowl")

choice=$(printf "Play\nStop" | dmenu -p "Ambiant Music:")

case $choice in 
  "Play")
    item=$(printf '%s\n' "${gnr[@]}" | dmenu)
    case $item in 
      "Lofi")
	item_name=Lofi
	url=https://www.youtube.com/watch?v=5qap5aO4i9A ;;
      "Relaxing")
	item_name=Relaxing
	url=https://www.youtube.com/watch?v=uYZSDsdY9Zs ;;
      "Rain")
	item_name=Rain
	url=https://www.youtube.com/watch?v=zJVX4E6DtjI ;;
      "Ocean")
	item_name=Ocean
	url=https://www.youtube.com/watch?v=rZ7VVGvrfiA ;;
      "Rap")
	item_name=Rap
	url=https://www.youtube.com/watch?v=n4pr7j-kTO0 ;;
      "Piano")
	item_name=Piano
	url=https://www.youtube.com/watch?v=XULUBg_ZcAU ;;
      "Tibetian Bowl")
	item_name=Tibetian Bowl
	url=https://www.youtube.com/watch?v=Y6QTdvbu0uI ;; 
    esac 
    mpv $url --no-video &
    if [ $? -eq 0 ];then
	notify-send "Ambiant Music" "[ $item_name ] selected and will play soon"
      else
	notify-send "Ambiant Music" "Error. Please check your URL"
    fi
    ;;
   "Stop")
     killall mpv ;;
esac

