#!/bin/bash
# install arch

dd if=/dev/urandom of=/dev/sda bs=4k status=progress
# create a GPT table with an EFI and LVM partition
cfdisk /dev/sda
# format partitions
mkfs.fat -F32 /dev/sda1
cryptsetup -v -y -c aes-xts-plain64 -s 512 -h sha512 -i 2000 --use-urandom luksFormat /dev/sda2
cryptsetup luksOpen /dev/sda2 luks
pvcreate /dev/mapper/luks
vgcreate lvm /dev/mapper/luks
lvcreate --name swap --size 4G lvm
lvcreate --name boot --size 512M lvm
lvcreate --name root --size 64G lvm
lvcreate --name home --extents 100%FREE lvm
mkswap /dev/mapper/swap
swapon /dev/mapper/swap
mkfs.ext4 /dev/mapper/boot
mkfs.ext4 /dev/mapper/root
mkfs.ext4 /dev/mapper/home
# mount
mount /dev/mapper/lvm-root /mnt
mkdir /mnt/boot
mount /dev/mapper/lvm-boot /mnt/boot
mkdir /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
mount /dev/mapper/lvm-home /mnt/home
# connect to the inet
wifi-menu
# init package database
pacman -Sy
# sort mirrors
pacman -S reflector
reflector --sort rate --protocol https --number 100 --fastest 50 --save /etc/pacman.d/mirrorlist
# install
pacstrap /mnt base base-devel fish git vim
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt fish
passwd
chsh -s /usr/bin/fish
# bootloader
pacman -S intel-ucode grub efibootmgr
dd if=/dev/urandom of=/crypto_keyfile.bin bs=512 count=8
cryptsetup --key-slot 7 luksAddKey /dev/sda2
# set grub config:
# GRUB_ENABLE_CRYPTODISK=y
# and cryptdevice=/dev/by-uuid/UUID:luks kernel parameter
vim /etc/default/grub
# set mkinitcpio config:
# FILES=(/crypto_keyfile.bin)
# and encryption+lvm2 hooks
vim /etc/mkinitcpio.conf
# install
grub-mkconfig -o /boot/grub/grub.cfg
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --recheck
mkinitcpio -P
chmod 400 /crypto_keyfile.bin
chmod 600 /boot/initramfs-linux*
