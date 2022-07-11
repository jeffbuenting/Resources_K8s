#!/bin/bash

AdminPW = $1
RHEL_Sub_user = $2
RHEL_Sub_PW = $3

"echo $AdminPW | sudo -S subscription-manager register --username $RHEL_Sub_user --password $RHEL_Sub_PW --auto-attach",
"echo $AdminPW | sudo -S yum update -y",
"echo $AdminPW | sudo -S yum install -y yum-utils",
"echo $AdminPW | sudo -S yum install -y nfs-utils",
"echo $AdminPW | sudo -S yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo",
"echo $AdminPW | sudo -S yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin --allowerasing",
"echo $AdminPW | sudo -S mkdir /etc/docker",
"echo $AdminPW | sudo -S mv /tmp/daemon.json /etc/docker/daemon.json",
"echo $AdminPW | sudo -S systemctl start docker",
"echo $AdminPW | sudo -S systemctl enable docker.service",
"echo $AdminPW | sudo -S systemctl enable containerd.service",
"echo $AdminPW | sudo -S curl -sfL https://get.k3s.io | sh -s - --docker --disable=traefik --write-kubeconfig-mode=644"