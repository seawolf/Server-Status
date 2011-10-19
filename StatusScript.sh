#!/bin/bash

HOST=`hostname`
WEBMASTER=`cat /root/Status-Script/Webmaster.txt` # add email address in that file

DM=`date +%d\ %B`
YYMMDD=`date +%Y-%m-%d`
HHMM=`date +%H%M`

/usr/sbin/aide --check >> /var/log/aide/check-$YYMMDD\_$HHMM.txt
/bin/mailx -s "AIDE Report for $HOST - $DM " $WEBMASTER < /var/log/aide/check-$YYMMDD\_$HHMM.txt
