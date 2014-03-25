#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
source ../config.sh

# Temp paths and files
FEDORA_V="20"
export SRC_PKG="http://mirrors.kernel.org/fedora/releases/20/Fedora/x86_64/iso/Fedora-${FEDORA_V}-x86_64-netinst.iso"
export TRG_NME="fedora-${FEDORA_V}"
export TRG_PKG=$TRG_NME".iso"

# Download syslinux and deploy it
. ./common/download.sh
TRG_PATH=$TFTP_PATH/boot/$TRG_NME
[ ! -d $TRG_PATH ] && mkdir $TRG_PATH -p
cp -r $TMP/$TRG_PKG $TFTP_PATH/boot/$TRG_NME

# Clean
. ./common/clean.sh
