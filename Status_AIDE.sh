#!/bin/bash
DIR="$( dirname "$0" )"
. $DIR/Setup_Status.sh

FILE="/var/log/aide/check-$YYMMDD-$HHMM.txt"

aide --check >> $FILE

for EMAIL in $WEBMASTER; do
  cat $FILE | mail -s "AIDE Report for $HOST - $DM " $EMAIL && rm $FILE
done
