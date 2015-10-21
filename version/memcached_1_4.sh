#!/bin/bash -e 

MEM_VERSION=1.4.23
LIB_VERSION=1.0.18

# Install prerequisites
sudo apt-get install -y libevent-dev

# Add memcache user to run the daemon later
sudo groupadd -r memcache
sudo useradd -r -g memcache memcache

# Install Memcached
sudo wget http://memcached.org/files/memcached-$MEM_VERSION.tar.gz
sudo tar xzf memcached-$MEM_VERSION.tar.gz && cd memcached-$MEM_VERSION
sudo ./configure
sudo make && sudo make install
cd .. && sudo rm -rf memcached-$MEM_VERSION && sudo rm -f memcached-$MEM_VERSION.tar.gz

# Run the memcached in the background
# memcached -u memcache >/dev/null 2>&1 &

# Install libmemcached
sudo wget https://launchpad.net/libmemcached/1.0/$LIB_VERSION/+download/libmemcached-$LIB_VERSION.tar.gz
sudo tar xzf libmemcached-$LIB_VERSION.tar.gz && cd libmemcached-$LIB_VERSION
sudo ./configure
sudo make && sudo make install
cd .. && sudo rm -rf libmemcached-$LIB_VERSION && sudo rm -f libmemcached-$LIB_VERSION.tar.gz
sudo ldconfig
