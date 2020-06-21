#!/bin/bash

# Exit on error
set -e

# Trace commands as we run them:
set -x

# Script used to initialize your ansible server after provisioning.
sudo add-apt-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get upgrade --assume-yes
sudo apt-get install ansible -y

# Ensure security key has proper permissions
chmod 700 ~/.ssh/mm_rsa

# Create the needed password file with specified password
PASSFILE=/home/vagrant/.vault-pass
echo "csc-devops-2020" > $PASSFILE

ansible-playbook /bakerx/cm/setup.yml --vault-password-file=$PASSFILE