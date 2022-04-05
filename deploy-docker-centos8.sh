#!/bin/bash
# Install docker 19.03 CE
dnf install epel-release curl -y
dnf install -y yum-utils device-mapper-persistent-data lvm2
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf install docker-ce --nobest -y
systemctl enable docker.service
systemctl start docker.service

# Install docker composer
curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
