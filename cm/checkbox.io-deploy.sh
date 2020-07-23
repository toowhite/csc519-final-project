#!/bin/bash

# Exit on error
set -e

# Trace commands as we run them:
set -x

set +x
ansible-playbook /bakerx/cm/checkbox.io-deploy.yml --vault-password-file=/home/vagrant/.vault-pass -i $1 -e CHECKBOX_IP=$2 -e PRIVATE_KEY_PATH=$4
set -x

if [ ! -d "/home/vagrant/checkbox.io" ]; then
    git clone https://github.com/chrisparnin/checkbox.io.git
    cd checkbox.io
    export GIT_SSH_COMMAND="ssh -i $4 -o StrictHostKeyChecking=no"
    git remote add checkbox ssh://"$3"@"$2"/home/vagrant/checkbox/.git
    git push checkbox master
    cd /home/vagrant
    rm -rf /home/vagrant/checkbox.io
fi
