<?php return [ 'debug' => filter_var(env('DEBUG', false), FILTER_VALIDATE_BOOLEAN),
 
 
    'reCaptcha' => [
    'secret' => '{{ webadmin_captcha_secret }}',
    'key' => '{{ webadmin_captcha_key }}'
    ],
 
    '_Constants' => [
        'encrypt' => 'SHA512-CRYPT',
        'quota_multiplier' => '1048576', // Constant to convert Bytes to MB and vice versa. Either use '1024000' or '1048576'
        'password_length' => '5',
        'strong_password' => true, // at least two letters, at least two numbers, at least one special character (Validation rules: MailboxTable.php)
        'aliases' => '10',
        'mailboxes' => '10',
        'maxquota' => '10',
        'unlimited' => '10485760', // 10TB - define unlimited in MB (eg. total storage capacity)
        'domain_quota_default' => '2000',
        'transport_options' => ['virtual' => 'virtual',  'local' => 'local',  'relay' => 'relay'],
        'transport_default' => 'virtual',        
        'domain_in_mailbox' => false,
    ],
     
    'App' => [
        'namespace' => 'App',
        'title' => '{{ dashboard_name }}',
        'encoding' => env('APP_ENCODING', 'UTF-8'),
        'defaultLocale' => env('APP_DEFAULT_LOCALE', 'es-ES'),
        'base' => false,
        'dir' => 'src',
        'webroot' => 'webroot',
        'wwwRoot' => WWW_ROOT,
        // 'baseUrl' => env('SCRIPT_NAME'),
        'fullBaseUrl' => false,
        'imageBaseUrl' => 'img/',
        'cssBaseUrl' => 'css/',
        'jsBaseUrl' => 'js/',
        'paths' => [
            'plugins' => [ROOT . DS . 'plugins' . DS],
            'templates' => [APP . 'Template' . DS],
            'locales' => [APP . 'Locale' . DS],
        ],
    ],
 
    'Security' => [
        'salt' => env('SECURITY_SALT', '{{ webadmin_salt }}'),
    ],
 
    'Asset' => [
        // 'timestamp' => true,
    ],
 
    'Cache' => [
        'default' => [
            'className' => 'File',
            'path' => CACHE,
            'url' => env('CACHE_DEFAULT_URL', null),
        ],
 
        '_cake_core_' => [
            'className' => 'File',
            'prefix' => 'myapp_cake_core_',
            'path' => CACHE . 'persistent/',
            'serialize' => true,
            'duration' => '+2 minutes',
            'url' => env('CACHE_CAKECORE_URL', null),
        ],
 
        '_cake_model_' => [
            'className' => 'File',
            'prefix' => 'myapp_cake_model_',
            'path' => CACHE . 'models/',
            'serialize' => true,
            'duration' => '+2 minutes',
            'url' => env('CACHE_CAKEMODEL_URL', null),
        ],
    ],
 
    'Error' => [
        'errorLevel' => E_ALL & ~E_DEPRECATED,
        'exceptionRenderer' => 'Cake\Error\ExceptionRenderer',
        'skipLog' => [],
        'log' => true,
        'trace' => true,
    ],
 
    'EmailTransport' => [
        'default' => [
            'className' => 'Mail',
            // The following keys are used in SMTP transports
            'port' => 25,
            'timeout' => 30,
            'client' => null,
            'tls' => null,
            'url' => env('EMAIL_TRANSPORT_DEFAULT_URL', null),
        ],
    ],
 
    'Email' => [
        'default' => [
            'transport' => 'default',
            'from' => '{{ support_email }}',
            //'charset' => 'utf-8',
            //'headerCharset' => 'utf-8',
        ],
    ],
 
    'Datasources' => [
        'default' => [
            'className' => 'Cake\Database\Connection',
            'driver' => 'Cake\Database\Driver\Mysql',
            'persistent' => false,
            'host' => 'localhost',
            //'port' => 'non_standard_port_number',
            'username' => 'mailadmin',
            'password' => '{{ mysql_mailadmin_passwd }}',
            'database' => 'a0001',
            'encoding' => 'utf8',
            'timezone' => 'UTC',
            'flags' => [],
            'cacheMetadata' => true,
            'log' => true,
 
            'quoteIdentifiers' => false,
 
            //'init' => ['SET GLOBAL innodb_stats_on_metadata = 0'],
             
            'url' => env('DATABASE_URL', null),
        ],
 
        'DB1' => [
            'className' => 'Cake\Database\Connection',
            'driver' => 'Cake\Database\Driver\Mysql',
            'persistent' => false,
            'host' => 'localhost',
            //'port' => 'non_standard_port_number',
            'username' => 'mailadmin',
            'password' => '{{ mysql_mailadmin_passwd }}',
            'database' => 'mailserver',
            'encoding' => 'utf8',
            'timezone' => 'UTC',
            'flags' => [],
            'cacheMetadata' => true,
            'log' => true,            
 
            'quoteIdentifiers' => false,
 
            //'init' => ['SET GLOBAL innodb_stats_on_metadata = 0'],
 
            'url' => env('DATABASE_URL', null),
        ],
         
        'test' => [
            'className' => 'Cake\Database\Connection',
            'driver' => 'Cake\Database\Driver\Mysql',
            'persistent' => false,
            'host' => 'localhost',
            //'port' => 'non_standard_port_number',
            'username' => 'my_app',
            'password' => '{{ mysql_cake_passwd }}',
            'database' => 'test_myapp',
            'encoding' => 'utf8',
            'timezone' => 'UTC',
            'cacheMetadata' => true,
            'quoteIdentifiers' => false,
            'log' => false,
            //'init' => ['SET GLOBAL innodb_stats_on_metadata = 0'],
            'url' => env('DATABASE_TEST_URL', null),
        ],        
    ],
 
    'Log' => [
        'debug' => [
            'className' => 'Cake\Log\Engine\FileLog',
            'path' => LOGS,
            'file' => 'debug',
            'levels' => ['notice', 'info', 'debug'],
            'url' => env('LOG_DEBUG_URL', null),
        ],
        'error' => [
            'className' => 'Cake\Log\Engine\FileLog',
            'path' => LOGS,
            'file' => 'error',
            'levels' => ['warning', 'error', 'critical', 'alert', 'emergency'],
            'url' => env('LOG_ERROR_URL', null),
        ],
    ],
 
    'Session' => [
        'defaults' => 'php',
    ],
];
