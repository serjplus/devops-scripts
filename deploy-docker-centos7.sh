#!/bin/bash
# Install docker 19.03 CE
yum install epel-release -y
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce -y
usermod -aG docker $(whoami)
systemctl enable docker.service
systemctl start docker.service

# Install docker composer
curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
