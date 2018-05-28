#!/bin/sh

set -e
set -x

# Create config directory
sudo mkdir -p /usr/local/etc/opendmarc/

# Create opendmarc user, group
sudo pw groupadd -n opendmarc -g 5002
sudo pw adduser -n opendmarc -c "opendmarc user" -u 5002 -g 5002 -d /usr/local/etc/opendmarc -s /usr/sbin/nologin

# Create config files
sudo cp /tmp/files/opendmarc/opendmarc.conf /usr/local/etc/mail
sudo cp /tmp/files/opendmarc/ignore.hosts /usr/local/etc/opendmarc

# Fix up permissions
sudo chown -R opendmarc:opendmarc /usr/local/etc/opendmarc
