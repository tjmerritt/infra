$config['password_db_dsn'] = 'mysqli://mailadmin:{{ mysql_mailadmin_passwd }}@localhost/mailserver';
$config['password_query'] = 'UPDATE mailserver.mailbox SET password=%c,modified=now() WHERE username=%u and domain=%d LIMIT 1';
