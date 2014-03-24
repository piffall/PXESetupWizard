#!/usr/bin/env bash

# Temp paths and files
export SRC_PKG="http://archive.ubuntu.com/ubuntu/dists/$REL/main/installer-$ARCH/current/images/netboot/ubuntu-installer/$ARCH/"
export TRG_NME="ubuntu"
export TRG_PKG=$TRG_NME

PRE_PATH=`pwd`

[ ! -d $TMP/$TRG_PKG ] && mkdir $TMP/$TRG_PKG -p
cd $TMP/$TRG_PKG
wget -r -nH --no-parent $SRC_PKG --reject="index.html*" --cut-dirs=10
cd $PRE_PATH

TRG_PATH=$TFTP_PATH/boot/ubuntu-$REL/ubuntu-installer/$ARCH
[ ! -d $TRG_PATH ] && mkdir $TRG_PATH -p
rsync -avP $TMP/$TRG_PKG/ $TRG_PATH --delete-after
. ./common/clean.sh
