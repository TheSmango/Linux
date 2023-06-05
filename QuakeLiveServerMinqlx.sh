#!/bin/bash

# Update the system
sudo apt update
sudo apt upgrade -y

# Install required dependencies
sudo apt install -y lib32gcc1 wget

# Install SteamCMD
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
tar -xvzf steamcmd_linux.tar.gz
rm steamcmd_linux.tar.gz

# Install Quake Live Dedicated Server
./steamcmd.sh +login anonymous +force_install_dir ~/qlserver +app_update 349090 +quit

# Install MinQLX
cd ~/qlserver
wget https://github.com/MinoMino/minqlx/archive/master.zip
unzip master.zip
rm master.zip
mv minqlx-master minqlx
cd minqlx
make

# Done!
echo "Quake Live Dedicated Server and MinQLX installed successfully!"
