# PXE SW
*NetBoot installers and Live OSs over TFTP*

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

### [Debian](http://www.debian.org)
- Debian Stable (i386,amd64)
- Debian Unstable (i386,amd64)

### [Ubuntu](http://www.ubuntu.com)
- Ubuntu Saucy (i386,amd64)

### Recovery
- [System Rescue CD](http://www.sysresccd.org)
- [Rescatux](http://www.supergrubdisk.org/rescatux/)
- [Super Grub Disk](http://www.supergrubdisk.org/super-grub2-disk/)

### Other GNU/Linux Based OS
- [OpenWRT](https://openwrt.org/)
- [GParted](https://gparted.org/)

### Diagnostic and detection
- [HDT](http://hdt-project.org) (Hardware Detection Tool)
- [MHDD](http://hddguru.com/software/2005.10.02-MHDD/) (Low-level HDD Diagnostic Tool)
- [Memtest86+](http://www.memtest.org/)

### Other OS
- [FreeDOS](http://www.freedos.org/)

### Boot Loaders
- [Charmeleon](http://chameleon.osx86.hu/) (EFI)
- [GAG](http://gag.sourceforge.net/) Graphical Boot Manager

### Other Tools
- [ntpasswd](http://pogostick.net/~pnh/ntpasswd/)
- [DBAN](http://www.dban.org/) (HDD Eraser)

## License
GPLv3
