#!/bin/bash
. Setup_Status.sh

ALL_LOGINS=`last | sed 's/  / /g'`
DATE_YESTERDAY=`date --date=yesterday +"%a %B %d"`
YESTERDAYS_LOGINS=`echo "$ALL_LOGINS" | grep "$DATE_YESTERDAY" `
USERS=`echo "$YESTERDAYS_LOGINS" |  awk '{print $1}' | uniq`

LOG="The following login sessions were created on $DATE_YESTERDAY:"

for USER in $USERS; do
  LOGINS=`echo "$YESTERDAYS_LOGINS" | grep "$USER" | wc -l`
  LOG="$LOG
  $USER: $LOGINS"
done

for EMAIL in $WEBMASTER; do
  echo "$LOG" | /bin/mail -s "User Access Report for $HOST - $DM " $EMAIL
done
