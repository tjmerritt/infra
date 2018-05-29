#!/bin/sh

set -e
set -x

# Fetch postfixadmin
git clone https://github.com/postfixadmin/postfixadmin.git

# Install into www directory
sudo mv postfixadmin /usr/local/www
sudo chown -R www  /usr/local/www/postfixadmin/templates_c

# Setup database
echo "CREATE USER postfix WITH PASSWORD '{{ postfixadmin_db_passwd }}';" | psql -U pgsql template1 
echo "CREATE DATABASE postfix OWNER postfix ENCODING 'unicode';" | psql -U pgsql template1

sudo tee /usr/local/www/postfixadmin/config.local.php <<@EOF
<?php
$CONF['database_type'] = 'pgsql';
$CONF['database_user'] = 'postfix';
$CONF['database_password'] = '{{ postfixadmin_db_passwd }}';
$CONF['database_name'] = 'postfix';

$CONF['default_aliases'] = array (
    'abuse' => '{{ abuse_email }}',
    'hostmaster' => '{{ hostmaster_email }}',
    'postmaster' => '{{ postmaster_email }}',
    'webmaster' => '{{ webmaster_email }}'
);

$CONF['domain_path'] = 'YES';
$CONF['domain_in_mailbox'] = 'NO';
$CONF['vacation_domain'] = 'autoreply.{{ primary_domain }}';
$CONF['footer_text'] = 'Return to {{ primary_domain }}';
$CONF['footer_link'] = 'https://{{ hostname }}';
$CONF['setup_password'] = 'b4b83bde4276f30a930f168e0d38c4fb:4d9080fc0fdaef48c061ed55e68a0cab471ab27c';

$CONF['configured'] = true;
?>
@EOF
