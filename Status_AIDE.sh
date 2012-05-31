#!/bin/bash
. Setup_Status.sh

FILE="/var/log/aide/check-$YYMMDD\_$HHMM.txt"

/usr/sbin/aide --check >> $FILE

for EMAIL in $WEBMASTER; do
  cat $FILE | /bin/mail -s "AIDE Report for $HOST - $DM " $EMAIL && rm $FILE
done
