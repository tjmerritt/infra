#!/bin/sh

set -e
set -x

# Update configuration variables
sudo tee -a /etc/rc.conf <<@EOF
hostname="mail2.tj.merritts.org"
zfs_enable="YES" # For ZFS filesystems
ntpd_enable="YES"
sshd_enable="YES"
mysql_enable="YES"
postgresql_enable="YES"
apache24_enable="YES"
postfix_enable="YES"
dovecot_enable="YES"
spamd_enable="YES"
spamd_flags="-d -m5 -x -q -Q -u nobody"
milteropendkim_enable="YES"
milteropendkim_uid="opendkim"
opendmarc_enable="YES"
opendmarc_runas="opendmarc"
clamav_clamd_enable="YES"
clamav_freshclam_enable="YES"
clamav_milter_enable="YES"
loginscript_enable="YES"
@EOF

sudo /etc/rc.d/hostname start
