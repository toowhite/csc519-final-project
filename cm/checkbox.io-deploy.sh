#!/bin/bash

# Exit on error
set -e

# Trace commands as we run them:
set -x

set +x
ansible-playbook /bakerx/cm/checkbox.io-deploy.yml --vault-password-file=/home/vagrant/.vault-pass -i $1
set -x

if [ ! -d "/home/vagrant/check" ]; then
    mkdir check
    cd check
    git clone https://github.com/chrisparnin/checkbox.io.git
    cd checkbox.io
    export GIT_SSH_COMMAND="ssh -i ~/.ssh/mm_rsa -o StrictHostKeyChecking=no"
    #TODO update for possibility of remote host
    git remote add checkbox ssh://vagrant@192.168.33.23/home/vagrant/checkbox/.git
    git push checkbox master
fi

ansible-playbook /bakerx/cm/nginx.yml --vault-password-file=/home/vagrant/.vault-pass -i $1