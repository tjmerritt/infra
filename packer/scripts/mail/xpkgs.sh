#!/bin/sh

set -e
set -x

PKGS="dovecot-pigeonhole"

sudo pkg install -y ${PKGS}
