#! /bin/bash

# Show network list
CHOICE=$(nmcli dev wifi list | tail -n +2 | cut -d '*' -f2 |  awk '{print " [ ",$2," ] ", " [ ",$8," ] "}' | dmenu -l 15 -p "Select your network: ")
[ -z "$CHOICE" ] && exit 0
IFACE=$(echo $CHOICE | awk '{print $2}')
if [ "$(nmcli con show | grep -c $IFACE)" == 1 ];then
  MESSAGE=$(nmcli dev wifi connect $IFACE)
  if [ "$(echo $MESSAGE | awk -F ':' '{print $1}')" == "Error" ];then
    notify-send "nmcli" "$(echo $MESSAGE | awk -F ': ' '{print $2}').$(echo $MESSAGE | awk -F ')' '{print $2}')"
  else
    notify-send "nmcli" "Successfully conneceted to [ $IFACE ]"
  fi
else
  # Get password
  PASSWORD=$(dmenu -p "Enter [ $IFACE ] password : " <&-)
  [ -z "$PASSWORD" ] && exit 0
  # Connect to the network
  MESSAGE=$(nmcli dev wifi connect "$IFACE" password "$PASSWORD")
  if [ "$(echo $MESSAGE | awk -F ':' '{print $1}')" == "Error" ];then
    notify-send "nmcli" "$(echo $MESSAGE | awk -F ': ' '{print $2}').$(echo $MESSAGE | awk -F ')' '{print $2}')"
  else
    notify-send "nmcli" "Connected successfully"
  fi
fi
