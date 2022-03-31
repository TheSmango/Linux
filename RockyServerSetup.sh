#!/bin/bash

echo "First we are going to install cockpit"
sleep 5
sudo dnf install cockpit -y
sleep 3
echo "Now let's enable cockpit to run on start-up or after reboot"
sleep 5
sudo systemctl enable --now cockpit.socket
sleep 3
echo "Let's enable the firewall to allow access to cockpit"
sleep 5
sudo firewall-cmd --add-service=cockpit
sudo firewall-cmd --add-service=cockpit --permanent
sleep 3
echo "I like being able to install extra things on my installs so let's enable epel-release"
sleep 5
sudo dnf install epel-release -y
sleep 5
echo "Neofetch is awesome and a good way to know what kernal and version of linux you are running, let's install it next"
sleep 3
sudo dnf install neofetch -y
sleep 3
echo "Network Manager is a powerful tool that will help you setup your hostname and ip address extremely easy."
sleep 5
sudo dnf install NetworkManager-tui -y
sleep 3
echo "Let's run network manager now and setup our hostname."
sleep 5
sudo nmtui
sleep 5
echo "Now, lets make sure OpenSSH is working so we can connect to the server remotely"
sleep 5
sudo dnf install openssh-server -y
sleep 1
sudo systemctl start sshd
sleep 1
sudo systemctl enable sshd
sleep 1
sudo firewall-cmd --zone=public --permanent --add-service=ssh
sleep 3
echo "This basic setup script for Rocky Linux is now complete. You should now reboot and make sure everything is working as intended"
sleep 5

