#!/bin/sh
defconfig="$1"
model="$2"
dtb="$3"

cd /root/rpi-buildroot

## Configure Buildroot
make $defconfig
/root/configBuildrootMain.sh
 
## Compile
make clean && make

## Copy fs
cp -r /root/rpi-buildroot/output/target /root/target-${model}
cd /root/target-${model}

rm THIS_IS_NOT_YOUR_ROOT_FILESYSTEM  # unnecessary warning text file

## Prepare per-model directory with appropriate kernel and dtb
mkdir ${model}
cp /root/rpi-buildroot/output/images/${dtb} ${model}/dtb
cp /root/rpi-buildroot/output/images/zImage ${model}/kernel

## Add custom scripts and emulation binary
cp /root/nfs_check etc/network
cp /root/S90walt-notify etc/init.d
cp /usr/bin/qemu-arm-static ./usr/bin/qemu-arm-static

