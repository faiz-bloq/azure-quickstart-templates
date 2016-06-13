#!/bin/bash

clear
echo "This script will setup a Bloq Enterprise Router.\n"

echo "To use this script you have to be using Ubuntu 14.04.\n"

echo "Adding Bloq Enterprise Repo...\n"   
sudo apt-add-repository 'deb https://pkg.bloqenterprise/ stable main'

echo "Receiving GPG keys...\n"
sudo gpg #init trustdb
sudo gpg --recv-key 91955EB3D6410A98 
sudo gpg -a --export 91955EB3D6410A98 | sudo apt-key add -

echo "Performing update...\n"
sudo apt-get update > /dev/null 2>&1
sudo apt-get -y upgrade > /dev/null 2>&1

echo "Installing and configuring BER...\n"
sudo apt-get -y install router-bloq > /dev/null 2>&1

echo "Configuring upstart ...\n"
cat << EOF > /etc/init/ber.conf
    description "BER Node Service"

    start on starting
    script
      /usr/local/bin/bitcoind
    end script
EOF
chmod +x /etc/init/ber.conf
sudo service ber start

echo 'BER started, enabled, installed...done.'
