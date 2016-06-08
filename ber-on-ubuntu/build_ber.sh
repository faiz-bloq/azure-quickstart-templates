#!/bin/bash

clear
echo "This script will setup a Bloq Enterprise Router."
echo "---"
echo "To use this script you have to be using Ubuntu 14.04."
echo "---"
echo "Performing a general system update (this might take a while)..."		
sudo apt-get update > /dev/null 2>&1
sudo apt-get -y upgrade > /dev/null 2>&1
sudo apt-get -y dist-upgrade > /dev/null 2>&1
echo "---"
echo "Installing prerequisites..."
sudo apt-get -y install git build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-all-dev > /dev/null 2>&1
echo "---"
echo "Enabling Ubuntu's unattended security upgrades..."
sudo apt-get -y install unattended-upgrades > /dev/null 2>&1
echo 'APT::Periodic::Update-Package-Lists "1";' | sudo tee --append /etc/apt/apt.conf.d/20auto-upgrades > /dev/null 2>&1
echo 'APT::Periodic::Unattended-Upgrade "1";' | sudo tee --append /etc/apt/apt.conf.d/20auto-upgrades > /dev/null 2>&1
echo "---"
echo "Configuring the UFW firewall..."
sudo ufw allow 22/tcp > /dev/null 2>&1
sudo ufw allow 18080/tcp > /dev/null 2>&1
sudo ufw --force enable > /dev/null 2>&1
echo "---"
echo "Installing and configuring BER..."
cd /tmp
git clone https://gitlab.com/bloqinc/router.git && cd router/
./autogen.sh && ./configure && make install
#TODO spawn in background and autosync
echo '...done.'
