#!/bin/bash

# install syslinux if not installed
[ ! -f syslinux/vesamenu.c32 ] && ./scripts/exec/syslinux.sh

# Replaces all files vesamenu.c32
for BADFILE in $(find boot/ -type f -iname "vesamenu.c32")
do
    echo "Replacing $BADFILE"
    cp -f syslinux/modules/bios/vesamenu.c32 $BADFILE
done
