#! /usr/bin/env bash
CHOICE=$(echo -e "Start Server\nStop Server" | dmenu -p "Jupyter Lab: ")

case $CHOICE in 
  "Start Server") 
    jupyter lab
    notify-send "Jupyter Lab" "Server Started";;
  "Stop Server") 
    killall jupyter-lab
    notify-send "Jupyter Lab" "Server Stoped";;
esac
