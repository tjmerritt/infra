#!/bin/sh

set -e
set -x

# Fetch ports
sudo portsnap --interactive fetch

# Extract ports
sudo portsnap extract

# Install postfix port
sudo mkdir -p /var/db/ports/mail_postfix
sudo cp /tmp/files/postfix/options /var/db/ports/mail_postfix
(cd /usr/ports/mail/postfix; DEFAULT_REPLACE_MAILERCONF=y sudo make install)

# Install dovecot port
sudo mkdir -p /var/db/ports/mail_dovecot
sudo cp /tmp/files/dovecot/options /var/db/ports/mail_dovecot
(cd /usr/ports/mail/dovecot; sudo make install)
