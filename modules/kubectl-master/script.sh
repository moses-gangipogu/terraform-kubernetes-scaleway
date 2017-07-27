#!/bin/bash

# update packages repo
sudo apt-get update -y

# setup ansible git
sudo apt-get install ansible git -y

# clone ansible-kubernetes git repo's
git clone -b master https://github.com/moses-gangipogu/ansible-kubernetes.git

# Orchestrating kubectl-master via ansible
ansible-playbook -i /opt/hosts ansible-kubernetes/kubectl-master.yaml
