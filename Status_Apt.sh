#!/bin/bash
DIR="$( dirname "$0" )"
. $DIR/Setup_Status.sh

LOG=""
LOG+="`apt-get update -qq`"
LOG+="`apt-get upgrade -qs`"

for EMAIL in $WEBMASTER; do
  echo -e "$LOG" | mail -s "Package Update Report for $HOST - $DM " $EMAIL
done
