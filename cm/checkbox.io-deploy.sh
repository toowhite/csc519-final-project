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
    export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no"
    git remote add checkbox ssh://"$3"@"$2"/home/vagrant/checkbox/.git
    git push checkbox master
fi

rm -rf /home/vagrant/check