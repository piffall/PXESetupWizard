#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
. ../config.sh

# Temp paths and files
export SRC_PKG="http://downloads.sourceforge.net/project/systemrescuecd/sysresccd-x86/4.0.1/systemrescuecd-x86-4.0.1.iso"
export TRG_NME="system-rescue-cd"
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

. ./system-rescue-cd/extract-other.sh

# Patching the init script
TRG_PATH=$TMP/$TRG_NME/initram
[ ! -d $TRG_PATH ] && mkdir $TRG_PATH -p
rm -rf $TRG_PATH/*
cp $TFTP_PATH/boot/$TRG_NME/isolinux/initram.igz $TMP/$TRG_NME/
cd $TRG_PATH
cat ../initram.igz | xz -d | cpio -id

patch -d $TRG_PATH < $TFTP_PATH/patches/$TRG_NME".patch"
find . | cpio -H newc -o | xz --check=crc32 --x86 --lzma2 > $TFTP_PATH/boot/$TRG_NME/isolinux/initram.igz

cd $TFTP_PATH/scripts/exec
. ./common/clean.sh
