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

packer build --only virtualbox-iso "${config}"
