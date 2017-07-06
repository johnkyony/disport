#!/bin/bash

### Set initial time of file
LTIME=`stat -c %Z /home/ubuntu/workspace/tendai/test/system/*.rb`

while true    
do
   ATIME=`stat -c %Z /home/ubuntu/workspace/tendai/test/system/*.rb`

   if [[ "$ATIME" != "$LTIME" ]]
   then    
       echo "rails test:system"
       LTIME=$ATIME
   fi
   sleep 5
done
