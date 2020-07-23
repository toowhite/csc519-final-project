#!/bin/bash

# Exit on error
set -e

# Trace commands as we run them:
set -x

# Script used to initialize your ansible server after provisioning.
sudo rm /var/lib/dpkg/lock-frontend
sudo add-apt-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get upgrade --assume-yes
sudo apt-get install ansible -y

# Ensure security key has proper permissions
chmod 700 ~/.ssh/mm_rsa
chmod 700 ~/.ssh/id_rsa
chmod +x /bakerx/cm/*.sh



PASSFILE=/home/vagrant/.vault-pass
set +x
ansible-playbook /bakerx/cm/setup.yml --vault-password-file=$PASSFILE -e GH_USER=$1 -e GH_PASS=$2
set -x
