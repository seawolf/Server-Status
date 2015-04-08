#!/bin/bash
DIR="$( dirname "$0" )"
. $DIR/Setup_Status.sh

ALL_LOGINS=`last`
DATE_YESTERDAY=`date --date=yesterday +"%a %b %e"`
YESTERDAYS_LOGINS=`echo -e "$ALL_LOGINS" | grep "$DATE_YESTERDAY" `
USERS=`echo -e "$YESTERDAYS_LOGINS" |  awk '{print $1}' | uniq`

LOG="The following login sessions were created on $DATE_YESTERDAY:"

for USER in $USERS; do
  LOGINS=`echo -e "$YESTERDAYS_LOGINS" | grep "$USER" | wc -l`
  LOG+="\n\t$USER: $LOGINS"
done

for EMAIL in $WEBMASTER; do
  echo -e "$LOG" | mail -s "User Access Report for $HOST - $DM " $EMAIL
done
