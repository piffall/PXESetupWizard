#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
source ../config.sh

# Temp paths and files
REL="24"
ARCH="x86_64"
export SRC_PKG="http://mirrors.kernel.org/fedora/releases/${REL}/Server/${ARCH}/os/images/pxeboot/"
export TRG_NME="fedora"
export TRG_PKG=$TRG_NME

PRE_PATH=`pwd`

[ ! -d $TMP/$TRG_PKG ] && mkdir $TMP/$TRG_PKG -p
cd $TMP/$TRG_PKG
#wget -r -nH --no-parent $SRC_PKG --reject="index.html*" --cut-dirs=8
wget ${SRC_PKG}vmlinuz
wget ${SRC_PKG}initrd.img
wget ${SRC_PKG}upgrade.img
cd $PRE_PATH

TRG_PATH=$TFTP_PATH/boot/$TRG_NME-$REL/fedora-installer/$ARCH
[ ! -d $TRG_PATH ] && mkdir $TRG_PATH -p
rsync -avP $TMP/$TRG_PKG/ $TRG_PATH --delete-after
. ./common/clean.sh
