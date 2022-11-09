#! /bin/bash
pacman -S base-devel vim networkmanager grub dosfstools efibootmgr os-prober 
ln -sf ~/usr/share/zoneinfo/Asia/Manila /etc/localtime 
hwclock --systohc
#en_US.UTF-8 UTF-8
#MAKE LOCALE.GEN
rm ~/etc/locale.gen
mv $(pwd)/locale.gen ~/etc/locale.gen
#hostname 
echo "mels-pc" >> /etc/hostname
#hosts
rm ~/etc/hosts 
mv $(pwd)/hosts ~/etc/
#passwd 
passwd 
#user mels
useradd -m mels
usermod -aG wheel,audio,video,optical,storage mels
passwd mels 
#sudo config
EDITOR=vim visudo 
#grub 
mkdir ~/boot/EFI
mount ~/dev/vda1 /boot/EFI 
cd 
grub-install --target=x86_64-efi --bootloader-id=grub_uefi 
grub-mkconfig -o /boot/grub/grub.cfg 
#systemd stuff
systemctl enable NetworkManager 
#
clear
echo "done mothafucka"