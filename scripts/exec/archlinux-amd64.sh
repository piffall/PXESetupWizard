#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
source ../config.sh

# Temp paths and files
REL="2015.06.01"
ARCH="x86_64"
export SRC_PKG="http://mirror.rackspace.com/archlinux/iso/${REL}/arch/boot/${ARCH}/"
export TRG_NME="archlinux"
export TRG_PKG=$TRG_NME

PRE_PATH=`pwd`

[ ! -d $TMP/$TRG_PKG ] && mkdir $TMP/$TRG_PKG -p
cd $TMP/$TRG_PKG
#wget -r -nH --no-parent $SRC_PKG --reject="index.html*" --cut-dirs=8
wget ${SRC_PKG}vmlinuz
wget ${SRC_PKG}archiso.img
cd $PRE_PATH

TRG_PATH=$TFTP_PATH/boot/$TRG_NME/archlinux-installer/$ARCH
[ ! -d $TRG_PATH ] && mkdir $TRG_PATH -p
rsync -avP $TMP/$TRG_PKG/ $TRG_PATH --delete-after
. ./common/clean.sh
