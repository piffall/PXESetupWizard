# PXE SW
_NetBoot installers and Live OSs over TFTP_

## Requirements
- Debian based OS (Debian,Ubuntu,Mint,...)
- 1,5 GB (Full setup)
- Some packages: wget, sudo, unzip, tar
- Configured TFTP Server (/srv/tftp/)
- Configured DHCP Server

## Installation
- Go to /srv/tftp/
- Clone this repository, I recomend you clone into your home path.
```
git clone https://github.com/piffall/pxe-sw /path/to/pxe-sw
```
- Run script and answer the questions
```
./setup.sh
```
- Create a symlink
```
ln -s /path/to/pxe/ /srv/tftp
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
