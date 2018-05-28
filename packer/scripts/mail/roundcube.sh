#!/bin/sh

set -e
set -x

roundcube_version=1.2.9
#roundcube_version=1.3.6

# Configure Roundcube
cd ~
fetch https://github.com/roundcube/roundcubemail/releases/download/${roundcube_version}/roundcubemail-${roundcube_version}-complete.tar.gz
tar zxvf roundcubemail-${roundcube_version}-complete.tar.gz
sudo mv roundcubemail-${roundcube_version} /usr/local/www/roundcube

sudo cp /tmp/files/roundcube/config.inc.php /usr/local/www/roundcube/config
sudo cp /tmp/files/roundcube/password_config.inc.php /usr/local/www/roundcube/plugins/password/config.inc.php

sudo chown -R root:wheel /usr/local/www/roundcube/
