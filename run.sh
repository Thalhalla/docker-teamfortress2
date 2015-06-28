#!/bin/bash

cd /home/steam
./tf2server start
echo "started server"
sleep 10
echo "retreiving details"
./tf2server monitor
sleep 3
sleep 300
# infinite loop to keep it open for Docker
while true; ./tf2server monitor; sleep 300; done
