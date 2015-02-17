#PXE SW
*NetBoot installers and Live OSs over TFTP*

## Requirements
- Debian based OS (Debian,Ubuntu,Mint,...)
- 1,5 GB (Full setup)
- Some packages: wget, sudo, unzip, tar
- Configured TFTP Server (/srv/tftp/)
- Configured DHCP Server

## Installation
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

### Popular GNU/Linux Distributions
- [Debian](http://www.debian.org)
- [Ubuntu](http://www.ubuntu.com)
- [OpenSuse](https://www.opensuse.org)
- [Fedora](https://getfedora.org/)

### More GNU/Linux Distributions
- [GParted](https://gparted.org/)
- [Kali Linux](https://www.kali.org/)
- [CoreOS](https://coreos.com)
- [OpenWRT](https://openwrt.org/)

### Recovery
- [System Rescue CD](http://www.sysresccd.org)
- [Rescatux](http://www.supergrubdisk.org/rescatux/)
- [Super Grub Disk](http://www.supergrubdisk.org/super-grub2-disk/)

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
All files are under GNU General Public License v3

### Donations
*Please consider support the project donating to the address below:*
1DgbSugso7kLuhU32gTVLnS7ZyRhjS6bKc
