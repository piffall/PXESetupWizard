#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
source ../config.sh

# Temp paths and files
VERSION="stable"
export SRC_PKG="http://${VERSION}.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz"
export SRC_PKG2="http://${VERSION}.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz"
export TRG_NME="coreos-stable"

# FIXME
export TRG_PKG="coreos_production_pxe.vmlinuz"
export TRG_PKG2="coreos_production_pxe_image.cpio.gz"

# Download syslinux and deploy it
. ./common/download.sh

TRG_PATH=$TFTP_PATH/boot/$TRG_NME
[ ! -d $TRG_PATH ] && mkdir $TRG_PATH -p
cp -r $TMP/$TRG_PKG $TFTP_PATH/boot/$TRG_NME
cp -r $TMP/$TRG_PKG2 $TFTP_PATH/boot/$TRG_NME

# Clean
. ./common/clean.sh

