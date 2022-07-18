#!/bin/bash

echo "This is a script for monitoring docker service"

docker_svc=$(systemctl status docker)

echo "$docker_svc"

echo "$docker_svc" > output.txt

if grep -q "running" output.txt; then
    echo "The Docker service is running"
else
    sudo systemctl start docker
    echo "The Docker service is not running and will be started"
    echo -e "To: mohamed.elemam.hussin@gmail.com\nFrom: mohamed.elemam.hussin@gmail.com\nSubject: The Docker service was stopped\n\nThe Docker service was stopped, errored, or inactive. The service has been started.\n " > alert.txt
    /usr/bin/ssmtp mohamed.elemam.hussin@gmail.com < alert.txt;
fi

sudo rm -f alert.txt output.txt
