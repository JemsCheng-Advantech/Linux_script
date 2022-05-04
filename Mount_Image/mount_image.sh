#!/bin/bash
#set -x #ehco on

read -p "Enter mount image name...: " IMAGE
read -p "Enter mount rootfs folder name...: " ROOTFS

PL=`fdisk -lu $IMAGE | grep "${IMAGE}2" | awk '{print $2}'`

sudo mount -o offset=$((PL*512)) $IMAGE $ROOTFS



