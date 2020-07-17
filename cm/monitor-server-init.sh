chmod 700 ~/.ssh/id_rsa

INVENTORY=$1
PASSFILE=/home/vagrant/.vault-pass
ansible-playbook /bakerx/cm/monitor-setup.yml -i /bakerx/cm/$INVENTORY --vault-password-file=$PASSFILE