#!/bin/bash

HOST=`cat /etc/hostname`

DM=`date +%d\ %B`
YYMMDD=`date +%Y-%M-%d`
HHMM=`date +%H%M`

aide --check > /var/log/aide/check-$YYMMDD\_$HHMM.txt
mail -s "AIDE Report for $HOST - $DM" $WEBMASTER /var/log/aide/check-$YYMMDD\_$HHMM.txt
