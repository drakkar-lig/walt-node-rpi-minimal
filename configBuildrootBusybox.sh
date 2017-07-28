#!/bin/bash

# Substitute unchosen busybox packages and their dependencies
sed -i -e 's/^.*CONFIG_TIMEOUT.*$/CONFIG_TIMEOUT=y/g' package/busybox/busybox.config
sed -i -e 's/^.*CONFIG_NC.*$/CONFIG_NC=y/g' package/busybox/busybox.config
sed -i -e 's/^.*CONFIG_NC_SERVER.*$/CONFIG_NC_SERVER=y/g' package/busybox/busybox.config
sed -i -e 's/^.*CONFIG_STATIC.*$/CONFIG_STATIC=y/g' package/busybox/busybox.config

