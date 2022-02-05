#! /bin/bash

FLAG=$(bluetoothctl show | awk '/Powered:/ {print $2}')

if [ "$FLAG" = "yes"  ]; then
  echo ""
fi

if [ "$FLAG" = "no"  ]; then
  echo ""
fi
