#!/bin/bash
#set -x #echo on

[ $# -lt 1 ] && echo "Please input RS-485 device node..., e.g. ./RS-485_enable.sh /dev/ttymxc0" && exit 1

echo "Enable RS-485 $1..."
stty -F $1 speed 115200 ignbrk -brkint -icrnl -imaxbel -opost -onlcr -isig -icanon -iexten -echo -echoe -echok -echoctl -echoke
sleep 1
./enable485 $1
sleep 1
stty -F $1 speed 115200 ignbrk -brkint -icrnl -imaxbel -opost -onlcr -isig -icanon -iexten -echo -echoe -echok -echoctl -echoke

echo "echo Test_RS-485 to $1 x5..."
sleep 1
for ((i=1;i<=5;i++))
do
    echo "Test_RS-485 to $1 +$i" > $1
    sleep 0.5
done
echo "Finished RS-485 Test..."

