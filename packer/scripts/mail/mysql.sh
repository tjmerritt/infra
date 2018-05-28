#!/bin/sh

set -e
set -x

# Copy config file
sudo cp /tmp/files/mysql/my.cnf /usr/local/etc/mysql

# Start server
sudo service mysql-server start

# Load mail server schema
mysql -u root < /tmp/files/mysql/mailserver.schema

# Load spamassassin schema
mysql -u root < /tmp/files/mysql/spamassassin.schema
mysql -u root spamassassin < /tmp/files/mysql/table_bayes_global_vars.schema
mysql -u root spamassassin < /tmp/files/mysql/table_userpref.schema

# Load a0001 schema
mysql -u root < /tmp/files/mysql/a0001.schema

# Load roundcube schema
mysql -u root < /tmp/files/mysql/roundcube.schema

# Update permissions on databases
mysql -u root < /tmp/files/mysql/update.mysql


