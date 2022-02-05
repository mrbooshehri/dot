#! /bin/bash
WORK_MIN=25
WORK_SEC=0
BREAK_MIN=5
BREAK_SEC=0

while [ $WORK_MIN -ge 0 ]; do
  while [ $WORK_SEC -ge 0 ]; do
          echo -ne "$WORK_MIN:$WORK_SEC\r"
          let "WORK_SEC=WORK_SEC-1"
          sleep 1
  done
  WORK_SEC=59
  let "WORK_MIN=WORK_MIN-1"
done
WORK_MIN=59

while [ $BREAK_MIN -ge 0 ]; do
  while [ $BREAK_SEC -ge 0 ]; do
          echo -ne "$BREAK_MIN:$BREAK_SEC\r"
          let "BREAK_SEC=BREAK_SEC-1"
          sleep 1
  done
  WORK_SEC=59
  let "BREAK_MIN=BREAK_MIN-1"
done
BREAK_MIN=59
