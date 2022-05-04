#!/bin/bash
#set -x #echo on

read -p "Enter First GPIO number..." gpion1
read -p "Enter Second GPIO number..." gpion2

[ ! -e /sys/class/gpio/gpio$gpion1 ] && echo "GPIO gpio$gpion1 not found, please export GPIO first." && exit 1
[ ! -e /sys/class/gpio/gpio$gpion2 ] && echo "GPIO gpio$gpion2 not found, please export GPIO first." && exit 1

#Set direction
echo in > /sys/class/gpio/gpio$gpion1/direction
echo out > /sys/class/gpio/gpio$gpion2/direction

#Set value
echo "Print GPIO$gpion1 value..."
cat /sys/class/gpio/gpio$gpion1/value

#Set 0
echo "Set GPIO$gpion2 to 0..."
echo 0 > /sys/class/gpio/gpio$gpion2/value
echo "Print GPIO$gpion1 value..."
cat /sys/class/gpio/gpio$gpion1/value

#Set 1
echo "Set GPIO$gpion2 to 1..."
echo 1 > /sys/class/gpio/gpio$gpion2/value
echo "Print GPIO$gpion1 value..."
cat /sys/class/gpio/gpio$gpion1/value



