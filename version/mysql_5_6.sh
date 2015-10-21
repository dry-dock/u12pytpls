#!/bin/bash -e

VERSION=5.6.23

# Preconfiguration setup
sudo apt-get install -y cmake libncurses5-dev
sudo groupadd mysql
sudo useradd -g mysql mysql
sudo chmod 1777 /tmp

# Install MySQL 5.6
sudo wget http://downloads.mysql.com/archives/get/file/mysql-$VERSION.tar.gz
sudo tar xzf mysql-$VERSION.tar.gz && sudo rm -f mysql-$VERSION.tar.gz
cd mysql-$VERSION
sudo cmake .
sudo make && sudo make install

# Postinstallation setup
cd /usr/local/mysql
sudo chown -R mysql .
sudo chgrp -R mysql .
sudo scripts/mysql_install_db --user=mysql
sudo chown -R root .
sudo chown -R mysql data
sudo cp support-files/mysql.server /etc/init.d/mysql
echo 'export PATH=$PATH:/usr/local/mysql/bin' >> $HOME/.bashrc
