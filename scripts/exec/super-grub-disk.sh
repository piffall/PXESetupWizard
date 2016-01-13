#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
source ../config.sh

# Temp paths and files
export SRC_PKG="http://forja.cenatic.es/frs/download.php/file/1844/super_grub2_disk_hybrid_2.02s3.iso"
export TRG_NME="sgd"
export TRG_PKG=$TRG_NME".iso"

# Download syslinux and deploy it
. ./common/download.sh
[ ! -d $TFTP_PATH/boot/$TRG_NME ] && {
	mkdir $TFTP_PATH/boot/$TRG_NME -p
}
cp $TMP/$TRG_PKG $TFTP_PATH/boot/$TRG_NME/

. ./common/clean.sh
