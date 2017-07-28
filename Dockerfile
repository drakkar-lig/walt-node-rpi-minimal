FROM debian:stretch

### Installing essential apps
RUN apt-get update && apt-get install -y git vim build-essential file wget cpio python unzip bc qemu-user-static libncurses-dev

### Get buildroot source using git
WORKDIR /root
RUN git clone git://github.com/buildroot/buildroot.git rpi-buildroot
WORKDIR /root/rpi-buildroot
RUN git checkout 2016.11.3

### Add scripts for customization of Bysybox and Buildroot
### configuration files, as well as the output, the fs,
### and after-install system files to the image
ADD configBuildrootBusybox.sh configBuildrootMain.sh nfs_check \
    S90walt-notify dump-tar.sh build-fs.sh  /root/

### Configure Busybox
RUN /root/configBuildrootBusybox.sh

### Build rpi-b / rpi-b-plus fs
RUN /root/build-fs.sh raspberrypi_defconfig rpi-b bcm2708-rpi-b.dtb
WORKDIR /root/target-rpi-b
RUN mkdir rpi-b-plus
RUN cp /root/rpi-buildroot/output/images/bcm2708-rpi-b-plus.dtb rpi-b-plus/dtb
RUN cd rpi-b-plus && ln -s ../rpi-b/kernel kernel
RUN tar cf /tmp/rpi-b.tar.gz .

### Build rpi-2-b fs
RUN /root/build-fs.sh raspberrypi2_defconfig rpi-2-b bcm2709-rpi-2-b.dtb
WORKDIR /root/target-rpi-2-b
RUN tar cf /tmp/rpi-2-b.tar.gz .

### Build rpi-3-b fs
RUN /root/build-fs.sh raspberrypi3_defconfig rpi-3-b bcm2710-rpi-3-b.dtb
WORKDIR /root/target-rpi-3-b
RUN tar cf /tmp/rpi-3-b.tar.gz .

### This image must be called (i.e. docker run...) with
### an argument specifying the raspberry pi board model
### (rpi-b, etc.). This argument will be passed to the
### following script that will dump the appropriate
### archive to stdout.
ENTRYPOINT ["/root/dump-tar.sh"]

