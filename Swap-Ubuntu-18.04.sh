#!/bin/bash

SwapSize=$1

sudo fallocate -l ${SwapSize}G /swapfile
ls -lh /swapfile

sudo chmod 600 /swapfile

sudo mkswap /swapfile

sudo swapon /swapfile

sudo swapon --show

sudo cp /etc/fstab /etc/fstab.bak

echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

cat /proc/sys/vm/swappiness

sudo sysctl vm.swappiness=10

sudo echo "vm.swappiness=10" >> /etc/sysctl.conf

cat /proc/sys/vm/vfs_cache_pressure

sudo sysctl vm.vfs_cache_pressure=50

sudo echo "vm.vfs_cache_pressure=50" >> /etc/sysctl.conf

