#!/bin/bash
DIR="$( dirname "$0" )"
. $DIR/Setup_Status.sh

FILE="/var/log/aide/update-$YYMMDD-$HHMM.txt"

aide --config=/etc/aide/aide.conf --update >> $FILE

for EMAIL in $WEBMASTER; do
  cat $FILE | mail -s "AIDE UPDATED on $HOST - $DM " $EMAIL && rm $FILE
done
