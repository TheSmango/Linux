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

# Generate server configuration
mkdir -p ~/qlserver/baseq3
cat > ~/qlserver/baseq3/server.cfg << EOL
seta sv_hostname "Fulltechpodcast.com CA Life"
seta sv_maxclients 16
seta sv_gameplay "3"
seta g_gameplayMutators "ffa,weapons,ca,lag,leech"
seta g_startingWeapons "0"
seta g_dropPowerups "0"
seta g_voteFlags "0"
seta g_friendlyfire "0"
seta g_respawnDelay "5"
seta g_roundtimelimit "15"
seta g_warmup "30"
seta g_timeoutCount "3"
seta g_timeoutPeriod "300"
seta g_timeoutJoiningPeriod "600"
seta g_deadChat "1"
seta g_startingHealth "125"
seta g_startingArmor "25"
seta g_healthArmorRespawn "5"
seta g_healthRespawn "25"
seta g_armorRespawn "25"
seta g_powerupRespawn "60"
seta g_allowVoting "0"
seta g_allowMapVoting "0"
seta g_allowGametypeVoting "0"
seta g_motd "Welcome to Fulltechpodcast.com CA Life Server!"
EOL

# Create systemd service
cat > ~/qlserver/quake.service << EOL
[Unit]
Description=Quake Live Dedicated Server
After=network.target

[Service]
Type=simple
User=$USER
WorkingDirectory=$HOME/qlserver
ExecStart=$HOME/qlserver/start.sh +set sv_port 27960 +set fs_game minqlx +set qlx_plugins "minqlx.so" +exec server.cfg
Restart=on-failure

[Install]
WantedBy=default.target
EOL

# Enable and start the service
sudo mv ~/qlserver/quake.service /etc/systemd/system/
sudo systemctl enable quake.service
sudo systemctl start quake.service

# Done!
echo "Quake Live Dedicated Server and MinQLX installed successfully!"
