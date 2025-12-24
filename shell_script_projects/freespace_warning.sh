#!/bin/bash
#
#
Dom=$(free -mt | grep "Total" | awk '{print $4}')
TO="kaleonkar012@gmail.com"

# Added spaces inside the brackets
if [[ $Dom -le 500]]
then
 
        echo "Warning!! Free memory is LOW: ${Dom}MB" |mail -s "Memory Alert" $TO
else
        echo "All Good TO GO"
fi


