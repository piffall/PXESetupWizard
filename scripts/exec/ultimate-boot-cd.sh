#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
. ../config.sh

# Temp paths and files
export SRC_PKG="http://ftp.cc.uoc.gr/mirrors/linux/ubcd/ubcd535.iso"
export TRG_NME="ultimate-boot-cd"
export TRG_PKG=$TRG_NME".iso"

# Download and deploy it
. ./common/download.sh
echo "Mounting "$TMP/$TRG_NME
[ ! -d $TMP/$TRG_NME ] && mkdir $TMP/$TRG_NME -p
7z x $TMP/$TRG_PKG -o$TMP/$TRG_NME

TRG_PATH=$TFTP_PATH/boot/$TRG_NME
[ ! -d $TRG_PATH ] && mkdir $TRG_PATH -p
rsync -avP $TMP/$TRG_NME/ $TFTP_PATH/boot/$TRG_NME --delete-after
find $TFTP_PATH/boot/$TRG_NME -type d -exec chmod 775 {} \;
find $TFTP_PATH/boot/$TRG_NME -type f -exec chmod 664 {} \;
find $TFTP_PATH/boot/$TRG_NME -type f -executable -exec chmod +rx {} \;

. ./common/clean.sh
