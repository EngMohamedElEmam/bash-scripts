#!/bin/sh

df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  echo $output
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $usep -ge 90 ]; then
    echo -e "To: mohamed.elemam.hussin@gmail.com\n From: mohamed.elemam.hussin@gmail.com\n Subject: Running out of space\n\nRunning out of space \"$partition ($usep%)\" on $(hostname) as on $(date) Please Check!!!\n " > alert.txt 
    /usr/sbin/ssmtp mohamed.elemam.hussin@gmail.com < alert.txt;
  fi
done
