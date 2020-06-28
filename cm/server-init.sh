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
sudo apt-get install jq -y

# Ensure security key has proper permissions
chmod 700 ~/.ssh/mm_rsa
chmod +x /bakerx/cm/run-jenkins-job.sh



PASSFILE=/home/vagrant/.vault-pass
ansible-playbook /bakerx/cm/setup.yml --vault-password-file=$PASSFILE

sleep 20

CRUMB=$(curl http://192.168.33.20:9000/crumbIssuer/api/xml?xpath=concat\(//crumbRequestField,%22:%22,//crumb\) \
-c cookies.txt \
--user 'admin:admin')

TOKENVALUE=$(curl -H "$CRUMB" 'http://192.168.33.20:9000/user/admin/descriptorByName/jenkins.security.ApiTokenProperty/generateNewToken' \
--data 'newTokenName=token' \
--user 'admin:admin' \
-b cookies.txt | jq -r '.data.tokenValue')

curl -X POST -u admin:"$TOKENVALUE" "http://@192.168.33.20:9000/credentials/store/system/domain/_/createCredentials" \
--data-urlencode 'json={
  "": "0",
  "credentials": {
    "scope": "GLOBAL",
    "id": "identification",
    "username": "'"${1}"'",
    "password": "'"${2}"'",
    "description": "ada",
    "$class": "com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl"
  }
}'

