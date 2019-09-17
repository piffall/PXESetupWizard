#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
. ../config.sh

export REL="bionic"
export ARCH="amd64"
. ./ubuntu/ubuntu-common.sh
