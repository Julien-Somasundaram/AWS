#!/bin/sh

# Fix permissions
chmod 600 myKey.pem


# Exécuter Ansible
ansible-playbook -i inventory playbook.yml
