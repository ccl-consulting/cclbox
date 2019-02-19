#!/bin/bash
# Disable print commands and their arguments as they are executed.
set +x
# Exit immediately if a command exits with a non-zero status.
set -e
# Init Vagrant Tocken
export VAGRANT_TOKEN=$(cat VAGRANT_TOKEN.txt)
# Build And Deploy the New Vagrant Box named CCL-Consulting/centos7
./packer build --only=qemu fedoraserver28.json
