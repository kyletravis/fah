#!/bin/bash

limit=4
count=`ps aux | grep -i "fahcorewrappe[r]" | wc -l`

if [ $count -lt $limit ] ; then
   echo "`date` count of $count is less than $limit instances - requesting work unit"
   echo "request-ws" | telnet localhost 36330
else
   echo "`date` count of $count is greater than or equal to $limit instances - doing nothing"
fi

exit 0
