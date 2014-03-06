#!/usr/bin/env bash
export SCRIPT_PATH=$(pwd)
export TFTP_PATH=$(dirname "$SCRIPT_PATH")
export TMP="/tmp/"$(date +"%Y%m%d%H%I%s%N" | md5sum | awk '{print $1}')
mkdir $TMP
