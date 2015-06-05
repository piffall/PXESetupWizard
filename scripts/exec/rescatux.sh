#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
. ../config.sh

# Temp paths and files
PKG_FILE="rescatux_cdrom_usb_hybrid_i386_amd64-486_0.30.2_sg2d.iso"
EMBEDDED_ISO="rescatux_cdrom_usb_hybrid_i386_amd64-486_0.30.2.iso"
export SRC_PKG="http://downloads.sourceforge.net/project/rescatux/rescatux_0_30_2/$PKG_FILE"
export TRG_NME="rescatux"
export TRG_PKG=$TRG_NME".iso"

# Download and deploy it
. ./common/download.sh
echo "Extracting "$TMP/$TRG_PKG" > "$TMP/$TRG_NME
[ ! -d $TMP/$TRG_NME ] && mkdir $TMP/$TRG_NME -p
7z x $TMP/$TRG_PKG -o$TMP/$TRG_NME

echo "Extracting "$TMP/$TRG_NME/boot/boot-isos/$EMBEDDED_ISO" > "$TMP/$TRG_NME
[ ! -d $TMP/$TRG_NME"_iso" ] && mkdir $TMP/$TRG_NME"_iso" -p
7z x $TMP/$TRG_NME/boot/boot-isos/$EMBEDDED_ISO -o$TMP/$TRG_NME"_iso"

TRG_PATH=$TFTP_PATH/boot/$TRG_NME
[ ! -d $TRG_PATH ] && mkdir $TRG_PATH -p
rsync -avP $TMP/$TRG_NME"_iso"/ $TRG_PATH --delete-after
find $TRG_PATH -type d -exec chmod 775 {} \;
find $TRG_PATH -type f -exec chmod 664 {} \;
find $TRG_PATH -type f -executable -exec chmod +rx \;

. ./common/clean.sh
