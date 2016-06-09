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
echo "Installing and configuring BER..."
cd /tmp
git clone https://gitlab.com/bloqinc/router.git && cd router/
./autogen.sh && ./configure && make install
#TODO spawn in background and autosync
#TODO install upstart script
#TODO ensure logs are written to /var/log/
echo '...done.'
