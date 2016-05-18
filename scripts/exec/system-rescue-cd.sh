#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
. ../config.sh

# Temp paths and files
export SRC_PKG="http://downloads.sourceforge.net/project/systemrescuecd/sysresccd-x86/4.7.2/systemrescuecd-x86-4.7.2.iso"
export TRG_NME="system-rescue-cd"
export TRG_PKG=$TRG_NME".iso"

# Download and deploy it
. ./common/download.sh
echo "Mounting " $TMP/$TRG_PKG " to " $TMP/$TRG_NME
[ ! -d $TMP/$TRG_NME ] && mkdir $TMP/$TRG_NME -p
7z -y x $TMP/$TRG_PKG -o$TMP/$TRG_NME

TRG_PATH=$TFTP_PATH/boot/$TRG_NME
[ ! -d $TRG_PATH ] && mkdir $TRG_PATH -p
rsync -avP $TMP/$TRG_NME/ $TRG_PATH --delete-after

# Make some changes
cd $TFTP_PATH
find boot/system-rescue-cd/ -type d -exec chmod 775 {} \;
find boot/system-rescue-cd/ -type f -exec chmod 664 {} \;
find boot/system-rescue-cd/ -type f -executable -exec chmod +rx {} \;
chmod 777 boot/system-rescue-cd/isolinux

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
