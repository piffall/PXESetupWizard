#!/usr/bin/env bash

#SRC_PKG="Already defined"

# Temp paths and files
export SRC_PKG="http://archive.ubuntu.com/ubuntu/dists/$REL/main/installer-$ARCH/current/images/netboot/mini.iso"
export TRG_NME="ubuntu"
export TRG_PKG=$TRG_NME".iso"

. ./download.sh

TRG_PATH=$TFTP_PATH/boot/ubuntu-$REL/ubuntu-installer/$ARCH
[ ! -d $TRG_PATH ] && mkdir $TRG_PATH -p
mv $TMP/$TRG_PKG $TRG_PATH
. ./clean.sh
