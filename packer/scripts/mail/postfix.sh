#!/bin/sh

set -e
set -x

postfixdir="/etc/postfix"

# Backup config files
sudo mv ${postfixdir}/main.cf ${postfixdir}/main.cf.orig
sudo mv ${postfixdir}/master.cf ${postfixdir}/master.cf.orig

# Copy config files
sudo cp /tmp/files/postfix/* ${postfixdir}

# Create additional config files
sudo touch ${postfixdir}/virtual_regexp
sudo touch ${postfixdir}/sender_transport
sudo touch ${postfixdir}/access
sudo touch ${postfixdir}/transport

# Create hash maps
sudo postmap hash:${postfixdir}/sender_transport
sudo postmap hash:${postfixdir}/access
sudo postmap hash:${postfixdir}/transport

# Update aliases files
#sudo newaliases
