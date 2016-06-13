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
# Add upstart task
cat << EOF > /etc/init/ber.conf
    description "BER Node Service"

    start on starting
    script
      /usr/local/bin/bitcoind
    end script
    EOF

chmod +x /etc/init/ber.conf
sudo service ber start
sudo apt-get -y install router-bloq > /dev/null 2>&1
echo 'BER started, enabled, installed...done.'
