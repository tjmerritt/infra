#!/bin/sh

set -e
set -x

# For details check: https://github.com/sophimail/webadmin/blob/master/INSTALLATION.md
cd ~
composer clearcache 
git clone https://github.com/sophimail/webadmin.git
sudo mv webadmin /usr/local/www
cd /usr/local/www/webadmin
echo Y | composer install
cp /tmp/files/webadmin/app.php config/app.php
cd /usr/local/www
sudo chown -R www webadmin

# Create admin user
sudo -u www /usr/local/www/webadmin/bin/cake users addSuperuser
# Set password
sudo -u www /usr/local/www/webadmin/bin/cake users resetPassword superadmin "{{ webadmin_passwd }}"


