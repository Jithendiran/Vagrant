#!/bin/bash 

sqlfile=sql-$(date +%d-%m-%Y:%H-%M-%S).sql
mysqldump -u backupadmin -p123456789 --databases my_db > /mnt/md127/backup/$sqlfile