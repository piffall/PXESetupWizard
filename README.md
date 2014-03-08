# PXE SW
_NetBoot installers and Live OSs over TFTP_

## Requirements
- Debian based OS (Debian,Ubuntu,Mint,...)
- 1,5 GB (Full setup)
- Some packages: wget, sudo, unzip, tar
- Configured TFTP Server (/srv/tftp/)
- Configured DHCP Server

## Installation
1. Go to /srv/tftp/
```
~$ cd /srv/tftp
```

2. Run script and answer the questions
```
~$ ./setup.sh
```

## OS and Tools

### Debian
- Debian Stable (i386,amd64)
- Debian Unstable (i386,amd64)

### Ubuntu
- Ubuntu Saucy (i386,amd64)

### Recovery
- System Rescue CD
- Rescatux
- Super Grub Disk

### Other (GNU/Linux) Based OS
- OpenWRT (Live only)

### Diagnostic
- HDT (Hardware Diagnostic Tool)
- AIDA (Old Hardware Diagnostic Tool)
- MHDD (Low-level HDD Diagnostic Tool)

### Other OS
- FreeDOS

### Boot Loaders
- Charmeleon (EFI)
- Graphical Boot Manager

### Other Tools
- NTPasswd
- DBAN (HDD Eraser)

## License
GPLv3
