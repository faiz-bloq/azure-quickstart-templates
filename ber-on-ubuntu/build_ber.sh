#!/bin/bash

clear
echo "This script will setup a Bloq Enterprise Router."
echo "---"
echo "To use this script you have to be using Ubuntu 14.04."
echo "---"
echo "Performing a general system update ..."		
sudo apt-add-repository 'deb https://pkg.bloqenterprise/ stable main'
gpg --recv-key 91955EB3D6410A98 && gpg -a --export 91955EB3D6410A98 | sudo apt-key add -
sudo apt-get update > /dev/null 2>&1
sudo apt-get -y upgrade > /dev/null 2>&1
echo "---"
echo "Installing and configuring BER..."
sudo apt-get -y install router-bloq > /dev/null 2>&1
bitcoind
#TODO spawn in background and autosync
#TODO install upstart script
#TODO ensure logs are written to /var/log/
echo '...done.'
