#!/bin/bash

HOST=`hostname`
WEBMASTER=`cat /root/Server-Status/Webmaster.txt` # add email address in that file

DM=`date +%d\ %B`
YYMMDD=`date +%Y-%m-%d`
HHMM=`date +%H%M`

/usr/sbin/aide --check >> /var/log/aide/check-$YYMMDD\_$HHMM.txt

for EMAIL in $WEBMASTER; do
  cat /var/log/aide/check-$YYMMDD\_$HHMM.txt | /bin/mail -s "AIDE Report for $HOST - $DM " $EMAIL
done
