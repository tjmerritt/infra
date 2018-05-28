#!/bin/sh

config="freebsd-11.2-BETA3-amd64-mail.json"

(cd templates; find . -type f) | while read f; do 
        dir=$(dirname "${f}")
        mkdir -p "files/${dir}"
        cp "templates/${f}" "files/${f}"
        jinja2 "templates/${f}" --strict --format=json --section=variables "${config}" >"files/${f}"
done

(cd script_templates; find . -type f) | while read f; do 
        dir=$(dirname "${f}")
        mkdir -p "files/${dir}"
        cp "script_templates/${f}" "scripts/${f}"
        jinja2 "script_templates/${f}" --strict --format=json --section=variables "${config}" >"scripts/${f}"
done

# Create cert if it does not already exist
if [ ! -f files/dovecot/dovecot.key -a ! -f files/dovecot/dovecot.cert ]; then
    openssl req -new -x509 -nodes -config files/dovecot/dovecot-openssl.conf -out files/dovecot/dovecot.cert -keyout files/dovecot/dovecot.key -days 365 || exit 2
    chmod 0600 files/dovecot/dovecot.key 
    openssl x509 -subject -fingerprint -noout -in files/dovecot/dovecot.cert || exit 2
fi

packer build --only virtualbox-iso "${config}"


