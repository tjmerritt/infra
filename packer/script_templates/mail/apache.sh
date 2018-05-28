#!/bin/sh

set -e
set -x

# Update server name in Apache configuration file
sudo sed -i '' -e 's/#ServerName www.example.com:80/ServerName {{ hostname }}/' /usr/local/etc/apache24/httpd.conf

# Setup PHP environment
sudo cp /usr/local/etc/php.ini-production /usr/local/etc/php.ini

# Configurate PHP timezone
sudo sed -i '' -e 's/;date.timezone =/date.timezone = UTC/' /usr/local/etc/php.ini

# Enable Apache modules
sudo sed -i '' -e 's/^#LoadModule ssl_module /LoadModule ssl_module /'                          \
        -e 's/^#LoadModule socache_shmcb_module /LoadModule socache_shmcb_module /'             \
        -e 's/^#LoadModule deflate_module /LoadModule deflate_module /'                         \
        -e 's/^#LoadModule cgi_module /LoadModule cgi_module /'                                 \
        -e 's/^#LoadModule rewrite_module /LoadModule rewrite_module /'                         \
        -e 's/^#LoadModule ssl_module /LoadModule ssl_module /'                                 \
        -e 's@^#Include etc/apache24/extra/httpd-default.conf@Include etc/apache24/extra/httpd-default.conf@' /usr/local/etc/apache24/httpd.conf

# Add php handlers
sudo tee -a /usr/local/etc/apache24/httpd.conf <<"@EOF"

DirectoryIndex index.html index.htm index.php
 
<FilesMatch "\.php$">
    SetHandler application/x-httpd-php
</FilesMatch>
<FilesMatch "\.phps$">
     SetHandler application/x-httpd-php-source
</FilesMatch>
@EOF

sudo cp /tmp/files/apache24/ssl.conf /usr/local/etc/apache24/Includes/
sudo cp /tmp/files/apache24/mail.conf /usr/local/etc/apache24/Includes/

sudo mkdir -p /usr/local/etc/ssl/apache
sudo cp /tmp/files/dovecot/dovecot.cert /usr/local/etc/ssl/apache/server.crt
sudo cp /tmp/files/dovecot/dovecot.key /usr/local/etc/ssl/apache/server.key
sudo chown -R www /usr/local/etc/ssl
sudo chmod -R 0400 /usr/local/etc/ssl

sudo service apache24 restart
