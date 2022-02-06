#!/bin/bash
menu=$(printf "Shutdown\nReboot\nLogout\nSuspend\nLock" | sort | dmenu -l 8)
case $menu in
"Shutdown") shutdown -P now ;;
"Reboot") shutdown -r now ;;
"Suspend") systemctl suspend ;;
"Logout") killall dwm;;
"Lock") betterlockscreen -l blur;;
*) exit ;;
esac
