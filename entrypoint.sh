#!/bin/bash
if [ "X$1" == "Xsetup" ];then
    cd /srv/tftp
    ./setup.sh
else
    /usr/sbin/in.tftpd --foreground --verbose --listen --user tftp --address [::]:69 /srv/tftp
fi
