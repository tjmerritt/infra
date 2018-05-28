#!/bin/sh

# Update vagrant boxes

# Destroy current box
vagrant box remove -f freebsd-11.2-BETA3-mail

# Start new box
vagrant box add --name freebsd-11.2-BETA3-mail freebsd-11.2-BETA3-amd64-mail-virtualbox.box 
