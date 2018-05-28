<?php
$config = array();
$config['db_dsnw'] = 'mysql://mailadmin:{{ mysql_mailadmin_passwd }}@localhost/roundcubemail';
$config['default_host'] = 'localhost';
$config['smtp_server'] = 'localhost';
$config['smtp_port'] = 25;
$config['smtp_user'] = '';
$config['smtp_pass'] = '';
$config['support_url'] = 'http://{{ hostname }}';
$config['product_name'] = '{{ company_webmail }}';
$config['des_key'] = 'rcmail-!24ByteDESkey*Str';
$config['plugins'] = array(
    'archive',
    'zipdownload',
    'managesieve',
    'acl',
    'password',
    'carddav',
    'calendar'
);
$config['skin'] = 'larry';        
