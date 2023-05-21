#!/bin/bash 

#nginx

openssl req -newkey rsa:4096  -x509  -sha512  -days 365 -nodes -out /mnt/md127/certificate/certificate.crt -keyout /mnt/md127/certificate/privatekey.key
sudo cp /mnt/md127/Scripts/site.conf /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/
sudo nginx -t && sudo nginx -s reload

#echo new cron into cron file
sudo crontab -l > mycron
sudo echo "0 0 * * * sh /mnt/md127/mysql_backup.sh" >> mycron
sudo crontab mycron
sudo rm mycron