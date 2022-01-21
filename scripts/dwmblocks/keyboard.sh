#!  /bin/bash

~/xkblayout-state/xkblayout-state print "%s" |awk -F "%" '{print $1}'
