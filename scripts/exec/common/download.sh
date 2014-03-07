#!/usr/bin/env bash
[ ! -f $TMP/$TRG_PKG ] && {
	wget $SRC_PKG -O $TMP/$TRG_PKG
}
