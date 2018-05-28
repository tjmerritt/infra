#!/bin/sh

set -e
set -x

#postfixdir="/usr/local/etc/postfix"
postfixdir="/etc/postfix"

# Create directories
sudo mkdir -p /etc/skel/Maildir/{cur,new,tmp}
sudo mkdir -p /usr/local/vhosts
sudo mkdir -p "${postfixdir}/keys"

# Setup keys
sudo cp /tmp/files/dovecot/dovecot.cert "${postfixdir}/keys/server.crt"
sudo cp /tmp/files/dovecot/dovecot.key "${postfixdir}/keys/server.key"

# Setup users and groups
sudo pw groupadd -n vmail -g 5000
sudo pw adduser -n vmail -c "Virtual mail user" -u 5000 -g 5000 -d /usr/local/vhosts -s /usr/sbin/nologin

# Setup permissions
sudo chown -R vmail:vmail /usr/local/vhosts/
sudo chown -R vmail:dovecot /usr/local/etc/dovecot/
sudo chmod -R o-rwx /usr/local/etc/dovecot/

# Create log file
sudo touch /var/log/dovecot.log
sudo chown vmail:vmail /var/log/dovecot.log

# Setup config files
sudo cp /tmp/files/dovecot/dovecot.conf /usr/local/etc/dovecot/
sudo cp /tmp/files/dovecot/dovecot-dict-sql.conf.ext /usr/local/etc/dovecot
sudo cp /tmp/files/dovecot/dovecot-sql.conf.ext /usr/local/etc/dovecot
