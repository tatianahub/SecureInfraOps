#!/bin/bash

# Create a new user "ans_user"
useradd -m -s /bin/bash ans_user

# Create an SSH directory for the new user
mkdir -p /home/ans_user/.ssh
chown -R ans_user:ans_user /home/ans_user/.ssh


echo "Send private key to the host"
echo "ssh-rsa YOUR_KEY" >> /home/ans_user/.ssh/authorized_keys
chown ans_user:ans_user /home/ans_user/.ssh/authorized_keys

# Set proper permissions
chmod 700 /home/ans_user/.ssh
chmod 600 /home/ans_user/.ssh/authorized_keys

# Add the user "ans_user" to the sudoers
echo "ans_user ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers

# echo "Host *
#     StrictHostKeyChecking no
#     UserKnownHostsFile=/dev/null" > ~/home/ans_user/.ssh/config
