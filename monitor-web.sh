#!/bin/bash

website_check=$(curl  -I https://www.devops-consulting.ml/)

echo "$website_check" > output.txt

if grep -q  "HTTP/2 200" output.txt; then
    printf "Devops-Consulting website is up\n"
else
    printf "The website is down\n"
    echo -e "To: mohamed.elemam.hussin@gmail.com\nFrom: mohamed.elemam.hussin@gmail.com\nSubject: Website Down\n\nDevops-Consulting Website is Down. Please Check!!!\n " > alert.txt
    /usr/bin/ssmtp mohamed.elemam.hussin@gmail.com < alert.txt;
fi

sudo rm -f alert.txt output.txt
