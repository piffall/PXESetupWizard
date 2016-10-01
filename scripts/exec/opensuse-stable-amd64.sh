#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
source ../config.sh

# Temp paths and files
SUSE_V="Leap-42.1"
export SRC_PKG="http://ftp.uni-kl.de/pub/linux/opensuse/distribution/openSUSE-stable/iso/openSUSE-${SUSE_V}-NET-x86_64.iso"
export TRG_NME="opensuse-stable"
export TRG_PKG=$TRG_NME".iso"

# Download syslinux and deploy it
. ./common/download.sh
TRG_PATH=$TFTP_PATH/boot/$TRG_NME
[ ! -d $TRG_PATH ] && mkdir $TRG_PATH -p
cp -r $TMP/$TRG_PKG $TFTP_PATH/boot/$TRG_NME

# Clean
. ./common/clean.sh
