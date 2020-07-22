#!/bin/bash

# Exit on error
set -e

# Trace commands as we run them:
set -x

set +x
ansible-playbook /bakerx/cm/iTrust-deploy.yml --vault-password-file=/home/vagrant/.vault-pass -i $1
set -x

