#!/bin/sh

set -e
set -x

# Configure OpenDKIM
sudo mv /usr/local/etc/mail/opendkim.conf /usr/local/etc/mail/opendkim.conf.orig
sudo mkdir -p /usr/local/etc/opendkim/
sudo mkdir -p /usr/local/etc/opendkim/keys

# Create opendkim user, group
sudo pw groupadd -n opendkim -g 5001
sudo pw adduser -n opendkim -c "opendkim user" -u 5001 -g 5001 -d /usr/local/etc/opendkim -s /usr/sbin/nologin

# Create blank files
sudo touch /usr/local/etc/opendkim/SigningTable
sudo touch /usr/local/etc/opendkim/KeyTable

# Create config files
sudo cp /tmp/files/opendkim/opendkim.conf /usr/local/etc/mail
sudo cp /tmp/files/opendkim/TrustedHosts /usr/local/etc/opendkim

# Fix permissions
sudo chown -R opendkim:opendkim /usr/local/etc/opendkim

