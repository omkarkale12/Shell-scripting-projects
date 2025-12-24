#!/bin/bash
#
#

no=8

for jk in 1 2 3 4 5 6 7 8 9 10
do
    if [[ $no -eq $jk ]] # Added spaces after [[ and before ]]
    then
        echo "$no is found" # Added space after echo
        break
    fi
done


#this for the odd number
#
for m in 1 2 3 4 5 6 7 8 9 10
do
    let r=m%2             # Use 'm' instead of 'i'
    if [[ $r -eq 0 ]]     # Add spaces inside the brackets
    then
        echo "Even: $m"
    fi
done

