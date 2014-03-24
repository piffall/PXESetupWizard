#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
. ../config.sh

export REL="trusty"
export ARCH="i386"
. ./ubuntu/ubuntu-common.sh
