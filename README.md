# DevOps-1

from project root directory, these commands can execute the environment. The playbook creates a build environment for checkbox.io
- npm install
- npm link
- pipeline setup
- pipeline playbook cm/playbook.yml cm/inventory.ini

ssh into config server, then cd /bakerx/cm run this command to execute the pipeline file
- jenkins-jobs --user admin --password admin update jobs/pipeline.yml 

So far it clone the repository and install npm.
