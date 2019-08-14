#!/bin/bash
((max_three = 255))
((max_four = 255))
((count_four = max_four))
((count_three = max_three))

while [[ $count_four -ne -1 ]] ; do
  while [[ $count_three -ne -1 ]] ; do
    ping -c 1 -W 0.01 192.168.$count_three.$count_four
    rc=$?
    if [[ $rc -eq 0 ]] ; then
      echo "192.168.$count_three.$count_four" >> ip_address_list.txt
      ((count_four = 0))
    fi
    ((count_three = count_three - 1)) 
  done
  ((count_three = max_three)) 
  ((count_four = count_four - 1)) 
done
