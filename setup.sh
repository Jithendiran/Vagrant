#!/bin/bash 

#config
hostnamectl set-hostname devops1.mydemo.org
# Host set up
echo '192.168.56.10 www.site1.mydemo.org site1.mydemo.org' >> /etc/hosts
echo '192.168.56.10 www.site2.mydemo.org site2.mydemo.org' >> /etc/hosts

#install
echo "Install dependency" 
apt update
apt install mysql-server php8.1 php8.1-mysql nginx cron openssl -y
apt purge apache2* -y

# RAID
mdadm --create --verbose /dev/md0 --level=10 --raid-devices=4 /dev/sdc /dev/sdd /dev/sde /dev/sdf
mkfs.ext4 -F /dev/md0
mdadm --detail --scan >> /etc/mdadm/mdadm.conf
echo '/dev/md127 /mnt/md127 ext4 defaults,nofail,discard 0 0' | sudo tee -a /etc/fstab

echo "After reboot run /mnt/md12/Scripts/setup.sh"
echo "Rebooting..."
echo "Thank you"
reboot




