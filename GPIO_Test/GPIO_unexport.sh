#!/bin/bash
#set -x #echo on

[ $# -lt 1 ] && echo "Please input GPIO number..., e.g. ./GPIO_export #number" && exit 1

echo "Export GPIO $1 to export..."
echo $1 > /sys/class/gpio/unexport
ls /sys/class/gpio/
