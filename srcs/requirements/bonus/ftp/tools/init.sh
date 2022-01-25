#!/bin/bash
mkdir -p /var/run/vsftpd/empty
useradd wspectra -d /ftp -s /bin/bash -m -u 1234
echo -e "0809\n0809" | passwd wspectra
groupadd ftgroup
usermod -G ftgroup wspectra
chown -R wspectra:ftgroup /ftp
chmod 777 /ftp
echo "wspectra" | tee -a /etc/vsftpd.userlist
vsftpd