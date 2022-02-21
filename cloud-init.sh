#!/bin/bash

# Add Local IAC User
sudo useradd -m -p $(openssl passwd -crypt ${akv_local_user_aws_linux_vm}) iacawslinadmin

#Enable Password Authentication
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

#Restart ssh services
sudo service sshd restart

#Add Group to visudoers
echo "%iacawslinadmin ALL=(ALL)       NOPASSWD: ALL" | sudo EDITOR="tee -a" visudo

