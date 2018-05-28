#!/bin/sh

set -e
set -x

# Initialize postgres
sudo service postgresql initdb

# Setup config files
sudo cp /tmp/files/postgresql/pg_hba.conf /usr/local/share/postgresql

# Start Postgres        
sudo service postgresql start </dev/null >/dev/null 2>&1 &

# Wait for postgres to start
sleep 15
