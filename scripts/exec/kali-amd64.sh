#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
. ../config.sh

# Temp paths and files
export SRC_PKG="http://repo.kali.org/kali/dists/kali-current/main/installer-amd64/current/images/netboot/netboot.tar.gz"
export TRG_NME="kali"
export TRG_PKG=$TRG_NME".tar.gz"

# Download and deploy it
. ./common/download.sh
[ ! -d $TFTP_PATH/boot/$TRG_NME ] && mkdir $TFTP_PATH/boot/$TRG_NME
tar vxzf $TMP/$TRG_PKG -C $TFTP_PATH/boot/$TRG_NME
. ./common/clean.sh
