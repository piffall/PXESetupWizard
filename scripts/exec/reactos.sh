#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
. ../config.sh

# Temp paths and files
export SRC_PKG="http://downloads.sourceforge.net/project/reactos/ReactOS/0.3.17/ReactOS-0.3.17-REL-live.zip"
export TRG_NME="reactos"
export TRG_PKG=$TRG_NME".zip"

# Download and deploy it
. ./common/download.sh
unzip $TMP/$TRG_PKG -d $TFTP_PATH/boot/$TRG_NME
. ./common/clean.sh
