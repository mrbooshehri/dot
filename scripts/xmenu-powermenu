#!/bin/sh

cat <<EOF | xmenu | sh &
  Lock		betterlockscreen -l blur	
  Logout		killall dwm
  Reboot		systemctl reboot
  Shutdown	systemctl poweroff
  Suspend		systemctl suspend
EOF

