#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
source ../config.sh

# Temp paths and files
export SRC_PKG="https://releng.archlinux.org/pxeboot/ipxe.lkrn"
export TRG_NME="archlinux"
export TRG_PKG="$TRG_NME.lkrn"

# Download
. ./common/download.sh

# Make directory and copy downloaded kernel
mkdir -p $TFTP_PATH/boot/$TRG_NME
cp $TMP/$TRG_PKG $TFTP_PATH/boot/$TRG_NME/$TRG_PKG

# Clean
. ./common/clean.sh
