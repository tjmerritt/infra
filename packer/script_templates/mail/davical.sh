#!/bin/sh

set -e
set -x

# Configure Davical
sudo cp /usr/local/www/davical/config/config.php /usr/local/www/davical/config/config.php.orig
sudo cp /tmp/files/davical/config.php /usr/local/www/davical/config

# Setup database
sudo -u pgsql sh -c 'cd /usr/local/share/davical/; sh dba/create-database.sh davical {{ davical_passwd }}'

# Setup Apache
sudo cp /tmp/files/davical/davical-localhost.conf /usr/local/etc/apache24/Includes


sudo tee -a /usr/local/etc/apache24/httpd.conf <<@EOF

DirectoryIndex index.html index.htm index.php
 
<FilesMatch "\.php$">
    SetHandler application/x-httpd-php
</FilesMatch>
<FilesMatch "\.phps$">
     SetHandler application/x-httpd-php-source
</FilesMatch>
@EOF

