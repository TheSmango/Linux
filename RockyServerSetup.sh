#!/bin/bash

echo "First, we are going to install Cockpit"
sleep 5

# Check package manager and install Cockpit
if command -v dnf &>/dev/null; then
  sudo dnf install cockpit -y
elif command -v apt-get &>/dev/null; then
  sudo apt-get install cockpit -y
else
  echo "Unsupported package manager. Please install Cockpit manually."
  exit 1
fi

sleep 3
echo "Now let's enable Cockpit to run on start-up or after reboot"
sleep 5

# Enable Cockpit service
if command -v systemctl &>/dev/null; then
  sudo systemctl enable --now cockpit.socket
else
  echo "Unsupported init system. Please enable Cockpit service manually."
fi

sleep 3
echo "Let's enable the firewall to allow access to Cockpit"
sleep 5

# Enable firewall rules for Cockpit
if command -v firewall-cmd &>/dev/null; then
  sudo firewall-cmd --add-service=cockpit
  sudo firewall-cmd --add-service=cockpit --permanent
else
  echo "Unsupported firewall. Please configure firewall rules for Cockpit manually."
fi

sleep 3
echo "Next, let's enable the EPEL repository"
sleep 5

# Install epel-release
if command -v dnf &>/dev/null; then
  sudo dnf install epel-release -y
elif command -v apt-get &>/dev/null; then
  sudo apt-get install epel-release -y
else
  echo "Unsupported package manager. Please install epel-release manually."
fi

sleep 5
echo "Neofetch is awesome and a good way to know what kernel and version of Linux you are running, let's install it next"
sleep 3

# Install neofetch
if command -v dnf &>/dev/null; then
  sudo dnf install neofetch -y
elif command -v apt-get &>/dev/null; then
  sudo apt-get install neofetch -y
else
  echo "Unsupported package manager. Please install neofetch manually."
fi

sleep 3
echo "Network Manager is a powerful tool that will help you set up your hostname and IP address extremely easily."
sleep 5

# Install NetworkManager-tui
if command -v dnf &>/dev/null; then
  sudo dnf install NetworkManager-tui -y
elif command -v apt-get &>/dev/null; then
  sudo apt-get install network-manager -y
else
  echo "Unsupported package manager. Please install NetworkManager-tui manually."
fi

sleep 3
echo "Let's run NetworkManager now and set up our hostname."
sleep 5

# Run nmtui to set up hostname
if command -v nmtui &>/dev/null; then
  sudo nmtui
else
  echo "nmtui is not available. Please configure NetworkManager and hostname manually."
fi

sleep 5
echo "Now, let's make sure OpenSSH is working so we can connect to the server remotely"
sleep 5

# Install and enable OpenSSH server
if command -v dnf &>/dev/null; then
  sudo dnf install openssh-server -y
elif command -v apt-get &>/dev/null; then
  sudo apt-get install openssh-server -y
else
  echo "Unsupported package manager. Please install openssh-server manually."
fi

# Start and enable sshd service
if command -v systemctl &>/dev/null; then
  sudo systemctl start sshd
  sudo systemctl enable sshd
else
  echo "Unsupported init system. Please start and enable sshd service manually."
fi

sleep 3
echo "This basic setup script is now complete. You should now reboot and make sure everything is working as intended"
sleep 5
