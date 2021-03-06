#!/bin/sh

set -e
set -x

PKGS=""
PKGS="${PKGS} ap24-mod_security apache24 apr arc arj autoconf autoconf-wrapper automake automake-wrapper bash bison ca_root_nss cclient clamav-milter cmake "
#PKGS="${PKGS} curl cvsps davical db5 dialog4ports dovecot dovecot-pigeonhole expat ezjail freetype2 gdbm gettext-runtime gettext-tools git gmake gnupg1 help2man icu indexinfo "
PKGS="${PKGS} curl cvsps davical db5 dialog4ports expat ezjail freetype2 gdbm gettext-runtime gettext-tools git gmake gnupg1 help2man icu indexinfo "
PKGS="${PKGS} jpeg-turbo json-c jsoncpp kbproto ldns libICE libSM libX11 libXau libXaw libXdmcp libXext libXmu libXp libXpm libXt libarchive libedit libevent libffi libiconv "
PKGS="${PKGS} libidn libltdl liblz4 libmcrypt libpthread-stubs libspf2 libtool libuv libxcb libxml2 libzip lua52 lzo2 m4 mod_php56 munin-common mysql56-client mysql56-server nano "
PKGS="${PKGS} oniguruma opendkim opendmarc p5-Algorithm-C3 p5-Authen-NTLM p5-Authen-SASL p5-B-Hooks-EndOfScope p5-BerkeleyDB p5-Bit-Vector p5-Cache p5-Cache-Cache p5-Carp-Clan "
PKGS="${PKGS} p5-Class-C3 p5-Class-Data-Inheritable p5-Class-Inspector p5-Class-Method-Modifiers p5-Class-Singleton p5-Crypt-CBC p5-Crypt-DES p5-Crypt-OpenSSL-Bignum p5-Crypt-OpenSSL-RSA "
PKGS="${PKGS} p5-Crypt-OpenSSL-Random p5-DBD-Pg p5-DBD-mysql p5-DBI p5-Data-OptList p5-Date-Calc p5-DateTime p5-DateTime-HiRes p5-DateTime-Locale p5-DateTime-TimeZone p5-Devel-StackTrace "
PKGS="${PKGS} p5-Digest-HMAC p5-Digest-SHA1 p5-Dist-CheckConflicts p5-Encode-Detect p5-Encode-Locale p5-Error p5-Eval-Closure p5-Exception-Class p5-File-Listing p5-File-NFSLock p5-File-ShareDir "
PKGS="${PKGS} p5-Filter p5-GSSAPI p5-HTML-Parser p5-HTML-Tagset p5-HTTP-Cookies p5-HTTP-Daemon p5-HTTP-Date p5-HTTP-Message p5-HTTP-Negotiate p5-Heap p5-IO-HTML p5-IO-Multiplex p5-IO-Socket-INET6 "
PKGS="${PKGS} p5-IO-Socket-IP p5-IO-Socket-SSL p5-IO-String p5-IO-stringy p5-IPC-ShareLite p5-LWP-MediaTypes p5-List-AllUtils p5-List-SomeUtils p5-List-SomeUtils-XS p5-List-UtilsBy p5-Locale-gettext "
PKGS="${PKGS} p5-MRO-Compat p5-Mail-DKIM p5-Mail-SPF p5-Mail-Tools p5-Module-Build p5-Module-Implementation p5-Module-Runtime p5-Mozilla-CA p5-Net-CIDR p5-Net-DNS p5-Net-DNS-Resolver-Programmable p5-Net-HTTP "
PKGS="${PKGS} p5-Net-IDN-Encode p5-Net-LibIDN p5-Net-SMTP-SSL p5-Net-SNMP p5-Net-SSLeay p5-Net-Server p5-NetAddr-IP p5-Package-Stash p5-Package-Stash-XS p5-Params-Util p5-Params-Validate "
PKGS="${PKGS} p5-Params-ValidationCompiler p5-Parse-Syslog p5-Role-Tiny p5-Scalar-List-Utils p5-Socket p5-Socket6 p5-Specio p5-Sub-Exporter p5-Sub-Exporter-Progressive p5-Sub-Identify p5-Sub-Install p5-Switch "
PKGS="${PKGS} p5-TimeDate p5-Try-Tiny p5-URI p5-Variable-Magic p5-WWW-RobotRules p5-XML-LibXML p5-XML-NamespaceSupport p5-XML-Parser p5-XML-SAX p5-XML-SAX-Base p5-YAML p5-libwww p5-namespace-autoclean "
PKGS="${PKGS} p5-namespace-clean pcre php56-pear php56-pear-Auth php56-pear-Auth_SASL php56-pear-Net_SMTP php56-pear-Net_Socket php56-pecl-intl perl5 pflogsumm php-libawl php-composer php56 php56-calendar php56-ctype php56-curl php56-dom php56-extensions "
PKGS="${PKGS} php56-filter php56-gd php56-gettext php56-hash php56-iconv php56-imap php56-json php56-mbstring php56-mcrypt php56-mysql php56-mysqli php56-opcache php56-openssl php56-pdo php56-pdo_mysql "
PKGS="${PKGS} php56-pdo_pgsql php56-pdo_sqlite php56-pgsql php56-phar php56-posix php56-session php56-simplexml php56-sqlite3 php56-tokenizer php56-xml php56-xmlreader php56-xmlwriter php56-zip php56-zlib "
PKGS="${PKGS} pkgconf png portmaster postgresql95-client postgresql95-server postgrey printproto pwgen py27-Babel py27-Jinja2 py27-MarkupSafe py27-alabaster py27-authres py27-dns py27-docutils py27-fail2ban "
PKGS="${PKGS} py27-imagesize py27-ipaddr py36-postfix-policyd-spf-python-2.0.2 py27-pygments py27-pyspf py27-pystemmer py27-pytz py27-setuptools py27-six py27-snowballstemmer py27-sphinx py27-sphinx_rtd_theme py27-sqlite3 "
PKGS="${PKGS} python2 python27 re2c readline rhash rsync scons screen spamassassin sqlite3 t1lib unzoo vsftpd-ssl xextproto xproto yajl "

#echo PKGS $PKGS
#echo " ____  _  ______ ____    /\ /\ "
#echo "|  _ \| |/ / ___/ ___|  |/\|/\|"
#echo "| |_) | ' / |  _\___ \         "
#echo "|  __/| . \ |_| |___) |        "
#echo "|_|   |_|\_\____|____/         "
#sleep 30

sudo pkg install -y ${PKGS}
