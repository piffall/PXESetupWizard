#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
. ../config.sh

# Temp paths and files
export SRC_PKG="ftp://mirror.komsys.org/pub/ubcd/ubcd529.iso"
export TRG_NME="ultimate-boot-cd"
export TRG_PKG=$TRG_NME".iso"

# Download and deploy it
. ./common/download.sh
echo "Mounting "$TMP/$TRG_NME
[ ! -d $TMP/$TRG_NME ] && mkdir $TMP/$TRG_NME -p
mount -t iso9660 -o loop $TMP/$TRG_PKG $TMP/$TRG_NME

TRG_PATH=$TFTP_PATH/boot/$TRG_NME
[ ! -d $TRG_PATH ] && mkdir $TRG_PATH -p
rsync -avP $TMP/$TRG_NME/ $TFTP_PATH/boot/$TRG_NME --delete-after
umount $TMP/$TRG_NME

#. ./common/clean.sh
