#!/usr/bin/env bash

#SRC_PKG="Already defined"

# Temp paths and files
export SRC_PKG="http://ftp.nl.debian.org/debian/dists/$REL/main/installer-$ARCH/current/images/netboot/netboot.tar.gz"
export TRG_NME="debian"
export TRG_PKG=$TRG_NME".tar.gz"

. ./download.sh

tar vxzf $TMP/$TRG_PKG -C $TMP/
TRG_PATH=$TFTP_PATH/boot/debian-installer/$REL/$ARCH
[ ! -d $TRG_PATH ] && mkdir $TRG_PATH -p
rsync -avP $TMP/debian-installer/$ARCH/ $TRG_PATH --delete-after
. ./clean.sh
