#!/bin/bash

# Exit on error
set -e

# Trace commands as we run them:
set -x

set +x
ansible-playbook /bakerx/cm/checkbox.io-deploy.yml --vault-password-file=/home/vagrant/.vault-pass -i $1
set -x

export GIT_SSH_COMMAND="ssh -i ~/.ssh/mm_rsa -o StrictHostKeyChecking=no"
#TODO update for possibility of remote host
git remote add checkbox ssh://vagrant@192.168.33.23/home/vagrant/checkbox/.git
git push checkbox master