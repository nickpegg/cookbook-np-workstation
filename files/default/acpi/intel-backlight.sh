#!/bin/sh

BACKLIGHT=/sys/class/backlight/intel_backlight/brightness

AMOUNT=20
CURRENT=`cat $BACKLIGHT`

echo $CURRENT > /tmp/bright

if [ "$1" = "up" ]; then
  NEW=`expr $CURRENT + $AMOUNT`
  echo $NEW > $BACKLIGHT
elif [ "$1" = "down" ]; then 
  NEW=`expr $CURRENT - $AMOUNT`
  if [ $NEW -lt $AMOUNT ]; then NEW=0; fi
  echo $NEW
  echo $NEW > $BACKLIGHT
fi
