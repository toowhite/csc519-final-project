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
chmod 700 ~/.ssh/id_rsa
# chmod +x /root/cm/*.sh

INVENTORY=$1
ansible-playbook /root/cm/monitor-setup.yml -i /root/$INVENTORY

