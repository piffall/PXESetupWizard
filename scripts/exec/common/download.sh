#!/usr/bin/env bash
[ ! -f $TMP/$TRG_PKG ] && {
    echo "wget $SRC_PKG -O $TMP/$TRG_PKG"
    wget $SRC_PKG -O $TMP/$TRG_PKG
}

[ ! -f $TMP/$TRG_PKG2 ] && [ "X" != "X$TRG_PKG2" ] && {
    echo "wget $SRC_PKG2 -O $TMP/$TRG_PKG2"
    wget $SRC_PKG2 -O $TMP/$TRG_PKG2
}
