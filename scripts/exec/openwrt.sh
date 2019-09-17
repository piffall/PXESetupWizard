#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
source ../config.sh

# Disabled because of unavailability of download
exit 0

# Temp paths and files
OPENWRT_VNUM="18.06.4"
export SRC_PKG="http://downloads.openwrt.org/releases/${OPENWRT_VNUM}/targets/x86/64/openwrt-${OPENWRT_VNUM}-x86-64-combined-squashfs.img"
export TRG_NME="openwrt"
export TRG_PKG=$TRG_NME".img"

# Download syslinux and deploy it
. ./common/download.sh
TRG_PATH=$TFTP_PATH/boot/$TRG_NME
[ ! -d $TRG_PATH ] && mkdir $TRG_PATH -p
cp -r $TMP/$TRG_PKG $TFTP_PATH/boot/$TRG_NME

# Clean
. ./common/clean.sh
