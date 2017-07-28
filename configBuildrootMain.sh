#!/bin/bash

# Substitute unchosen dropbear package and its dependencies
sed -i -e 's/^.*# BR2_PACKAGE_DROPBEAR is not set.*$/BR2_PACKAGE_DROPBEAR=y\nBR2_PACKAGE_DROPBEAR_CLIENT=y\n# BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS is not set\nBR2_PACKAGE_DROPBEAR_SMALL=y\n# BR2_PACKAGE_DROPBEAR_WTMP is not set\n# BR2_PACKAGE_DROPBEAR_LASTLOG is not set/g' .config
sed -i -e 's/^.*# BR2_PACKAGE_ATFTP is not set.*$/# BR2_PACKAGE_ATFTP is not set\n# BR2_PACKAGE_AUTOSSH is not set/g' .config
sed -i -e 's/^.*BR2_PACKAGE_ZLIB.*$/BR2_PACKAGE_ZLIB=y/g' .config

