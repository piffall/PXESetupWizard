#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
. ../config.sh

# Version of memtest
MT_VER="memtest86+-5.01"

# Temp paths and files
export SRC_PKG="http://www.memtest.org/download/5.01/"$MT_VER".bin.gz"
export TRG_NME=$MT_VER
export TRG_PKG=$TRG_NME".bin.gz"

# Create tmp path
. ./common/download.sh
gunzip $TMP/$TRG_PKG
[ ! -d $TFTP_PATH/boot/memtest ] && mkdir $TFTP_PATH/boot/memtest
mv $TMP/$TRG_NME".bin" $TFTP_PATH/boot/memtest/memtest

. ./common/clean.sh
