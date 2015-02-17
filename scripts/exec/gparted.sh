#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
. ../config.sh

# Temp paths and files
export SRC_PKG="http://downloads.sourceforge.net/project/gparted/gparted-live-stable/0.21.0-1/gparted-live-0.21.0-1-amd64.zip"
export TRG_NME="gparted"
export TRG_PKG=$TRG_NME".zip"

# Download and deploy it
. ./common/download.sh
unzip $TMP/$TRG_PKG -d $TFTP_PATH/boot/$TRG_NME
. ./common/clean.sh
