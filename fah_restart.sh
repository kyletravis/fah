#!/bin/bash

tsfile=`stat -c %Y /var/lib/fahclient/log.txt`
now=`date +%s`
diff=`echo "$now-$tsfile" | bc`
limit=300

if [ $diff -gt $limit ] ; then
   echo "`date` diff of $diff is greater than $limit seconds - restarting"
   /etc/init.d/FAHClient stop
   killall -9 FAHClient
   sleep 15
   /etc/init.d/FAHClient start
else
   echo "`date` diff of $diff is less than $limit seconds - doing nothing"
fi

exit 0
