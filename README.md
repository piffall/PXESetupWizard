# PXE SW

[![Gitter](https://img.shields.io/gitter/room/nwjs/nw.js.svg?maxAge=2592000?style=flat-square)](https://gitter.im/piffall/pxe-sw)

*NetBoot installers and Live OSs over TFTP*. This project is a wizard,
collection of install scripts, patches, ... to setup a PXE server with
most popular GNU/Linux distros.

## Dockerized

- Clone this repository.
```bash
git clone https://github.com/piffall/pxe-sw
```

- Build image and setup, this could take several time
```bash
make all
```

After this point, the container is ready. You only need to start/stop when you
need.

```bash
docker start pxe-sw
docker stop pxe-sw
```

### Systemd (to start up on boot)

#### Enable as service
```bash
make install # Systemd only
```

## Hosted

### Requirements

- Debian based OS (Debian,Ubuntu,Mint,...)
- Some packages: wget, sudo, unzip, tar, ...

### Install

- Install dependencies
```
sudo apt-get -y install git tftpd-hpa unzip wget curl p7zip-full xzip xz-utils cpio
```

- Clone this repository, I recomend you clone into your home path.
```
git clone https://github.com/piffall/pxe-sw /path/to/pxe-sw
```

- Setup (required step)

This will ask for IP address to listen to, and if you want to setup all OS.
If you are only interested in one of them, answer "n" to this question.
```
./setup.sh
```

- Specific OS setup

If you only want to setup one OS, for example, Debian, find corresponding
setup script and run it, after that, you shuold run fix-vesamenu.sh.
```
./scripts/exec/debian-stable-amd64.sh
./fix_vesamenu.sh
```

- Create a symlink

If you /srv/tftp already exists, this will cause an error, please backup and
remove /srv/tftp before symlink.
```
sudo ln -s /path/to/pxe/ /srv/tftp
```

### Configure and install TFTP server

- Install tftpd-hpa
```bash
sudo apt-get install tftpd-hpa
```

- Edit the configuration file "/etc/default/tftpd-hpa"
```bash
# /etc/default/tftpd-hpa

TFTP_USERNAME="tftp"
TFTP_DIRECTORY="/srv/tftp"
TFTP_ADDRESS="0.0.0.0:69"
TFTP_OPTIONS="--verbose"
#TFTP_OPTIONS="--secure"
```

*Note that "--secure" option line is commented*

# Configure DHCP Server

## Configure with OpenWRT dhcp server

- Edit the DHCP configuration file "/etc/config/dhcp" to add a dhcp\_boot option
```
config dnsmasq
  option domainneeded '1'
  option boguspriv '1'
  option localise_queries '1'
  ...
  option dhcp_boot '/srv/tftp/pxelinux.0,pxe-hostname,192.168.1.254' # Change host and IP address.
```
- Restart your device

## Configure with DHCP3 Server

- Add an option to the network configuration
```
subnet 192.168.1.0 netmask 255.255.255.0 {
	range 192.168.1.200 192.168.1.253;
	option domain-name "lan";
	default-lease-time 1800;
	max-lease-time 7200;
	next-server "192.168.1.254";                     # The TFTP IP address
	option bootfile-name "/srv/tftp/pxelinux.0";     # The PXE file
}
```

## OS and Tools

### Popular GNU/Linux Distributions
- [Debian](http://www.debian.org)
- [Ubuntu](http://www.ubuntu.com)
- [CentOS](https://www.centos.org)
- [OpenSuse](https://www.opensuse.org)
- [Fedora](https://getfedora.org/)
- [Archlinux](https://www.archlinux.org/)

### More GNU/Linux Distributions
- [GParted](https://gparted.org/)
- [Kali Linux](https://www.kali.org/)
- [CoreOS](https://coreos.com)
- [OpenWRT](https://openwrt.org/)
- [ProxmoxVE](https://proxmox.com/) (It neets to be downloaded manually) [See](https://github.com/morph027/pve-iso-2-pxe)

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
- [VMWare ESXi](https://my.vmware.com/web/vmware/evalcenter?p=free-esxi6) (It needs to be downloaded manually)

### Boot Loaders
- [Charmeleon](http://chameleon.osx86.hu/) (EFI)
- [GAG](http://gag.sourceforge.net/) Graphical Boot Manager

### Other Tools
- [ntpasswd](http://pogostick.net/~pnh/ntpasswd/)
- [DBAN](http://www.dban.org/) (HDD Eraser)

## License
All files are under GNU General Public License v3

### Donations (BTC)
*Please consider support the project donating to the Bitcoin address below:*

17q6RT31yEJAptrUzXhwEq5iPwEguEFFBG
