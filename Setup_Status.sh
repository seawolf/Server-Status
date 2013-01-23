#!/bin/bash

HOST=`hostname`
DIR="$( dirname "$0" )"
WEBMASTER=`cat $DIR/Webmaster.txt` # add email address in that file

DM=`date +%d\ %B`
YYMMDD=`date +%Y-%m-%d`
HHMM=`date +%H%M`
