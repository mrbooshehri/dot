#! /bin/bash

# 1) ps get processes belongs to mhmd user
# 2) sed remove the first line of the output (heading)
# 3) awk print (PID, CPU%, MEM%, CMD) with " | " delimiter
# 4) dmenu show the results as a menu
# 5) cut get the first element of picked line (PID)
PID=$(ps -U mhmd u | sed '1d' | awk '{print $2, " | ", $3, " | ", $4, " | ", $11}' | dmenu -l 15 | cut -d " " -f 1)

# check if $PID is not null
if [[ -n $PID ]]; then
  # kill the selected process with default signal (-9)
	kill "$PID"
	# check the result of kill command and send related notification
	case $? in
	  "0")
	    notify-send -t 2000 -u lowi "Process Killer" "  Process terminated successfully";;
	  "1")
	    notify-send -t 2000 -u urgent "Process Killer" "  Process termination failed";;
	  "64")
	    notify-send -t 2000 -u normal "Process Killer" "  Process terminated partial successful";;
	esac
fi
