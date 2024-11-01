#!/bin/bash
R="\e[31m"
G="\e[32m"
N="\e[0m"
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user
echo -e "$G Docker successfully installed $N"
echo -e "$R Logout and Login again $N"