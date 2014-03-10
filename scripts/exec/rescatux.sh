#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
. ../config.sh

# Temp paths and files
#export SRC_PKG="http://sourceforge.net/projects/rescatux.berlios/files/rescatux_cdrom_usb_hybrid_i386_amd64-486_0.30_sg2d.iso/download"
export SRC_PKG="http://sourceforge.net/projects/rescatux/files/rescatux_0_31_b5/rescatux_cdrom_usb_hybrid_i386_amd64-486_0.31b5_sg2d.iso/download"
export TRG_NME="rescatux"
export TRG_PKG=$TRG_NME".iso"

# Download and deploy it
. ./common/download.sh
echo "Mounting "$TMP/$TRG_NME
[ ! -d $TMP/$TRG_NME ] && mkdir $TMP/$TRG_NME -p
#mount -t iso9660 -o loop $TMP/$TRG_PKG $TMP/$TRG_NME 
7z x $TMP/$TRG_PKG -o$TMP/$TRG_NME

echo "Mounting "$TMP/$TRG_NME/boot/boot-isos/rescatux_cdrom_usb_hybrid_i386_amd64-486_0.31b5.iso
[ ! -d $TMP/$TRG_NME"_iso" ] && mkdir $TMP/$TRG_NME"_iso" -p
#mount -t iso9660 -o loop $TMP/$TRG_NME/boot/boot-isos/rescatux_cdrom_usb_hybrid_i386_amd64-486_0.31b5.iso $TMP/$TRG_NME"_iso"
7z x $TMP/$TRG_NME/boot/boot-isos/rescatux_cdrom_usb_hybrid_i386_amd64-486_0.31b5.iso -o$TMP/$TRG_NME"_iso"

TRG_PATH=$TFTP_PATH/boot/$TRG_NME
[ ! -d $TRG_PATH ] && mkdir $TRG_PATH -p
rsync -avP $TMP/$TRG_NME"_iso"/ $TRG_PATH --delete-after

# Important umount order
#umount $TMP/$TRG_NME"_iso"
#umount $TMP/$TRG_NME

. ./common/clean.sh
