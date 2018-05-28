#!/bin/sh

set -e
set -x

sudo mv /usr/local/etc/mail/spamassassin/local.cf /usr/local/etc/mail/spamassassin/local.cf.orig

# Install configuration file
sudo cp /tmp/files/spamassassin/local.cf /usr/local/etc/mail/spamassassin

# Update spamassassin definitions (optional)
sudo sa-update

# Verify spamassassin configuration (optional)
sudo spamassassin --lint

# Spamassassin performance tune-up (suggestion)
#File: /usr/local/etc/mail/spamassassin/local.cf
#bayes_auto_expire   0
#bayes_expiry_max_db_size 1000000
## Place in crontab: sa-learn --force-expire
