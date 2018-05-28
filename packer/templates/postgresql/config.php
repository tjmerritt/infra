<?php $c->authenticate_hook['call'] = 'IMAP_PAM_check';
$c->authenticate_hook['config'] = array('imap_url' => '{localhost:143/imap/tls/novalidate-cert}');
include('drivers_imap_pam.php');
$c->admin_email = '{{ support_email }}';
$c->system_name = '{{ hostname }}';
$c->pg_connect[] = 'dbname=davical port=5432 user=davical_app';
$c->enable_auto_schedule = false;
?>
