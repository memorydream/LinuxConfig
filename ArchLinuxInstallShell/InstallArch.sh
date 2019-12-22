#!/bin/sh

#this my install arch
#run before start arch and arfter chroot

#variables
localeGen = /etc/locale.gen
myHostName = "arch"

#will install packages:

#vim dhcpcd sudo grub [efibootmgr]

#install setting

#setting localtime
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --sysohc

#setting local.gen
echo "en_US.UTF-8 UTF-8" > $localeGen
echo "zh_CN.UTF-8 UTF-8" > $localeGen
echo "zh_TW.UTF-8 UTF-8" > $localeGen

locale-gen

#write locale.conf
if [ -f "/etc/locale.conf"]; then
	rm /etc/locale.conf
fi

echo "LANG=en_US.UTF-8" > /etc/locale.conf

#end write

#write hostname

if [ -f "/etc/hostname" ] && rm /etc/hostname

echo $myHostName > /etc/hostname

#end write

#install software packages

pacman -S vim dhcpcd sudo grub

if [ -d /sys/firmware/efi/efivars ]; then
	pacman -S efibootmgr
fi

#end install

echo "plase set root password:"
passwd

echo "plase use grub setting boot"
