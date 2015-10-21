#!/bin/bash -e

VERSION=3.0.0

# Install Redis 3.0
sudo wget http://download.redis.io/releases/redis-$VERSION.tar.gz
sudo tar xzf redis-$VERSION.tar.gz && sudo rm -f redis-$VERSION.tar.gz
cd redis-$VERSION
make
sudo ln -s $(pwd)/src/redis-server /usr/local/bin/redis-server
sudo ln -s $(pwd)/src/redis-cli /usr/local/bin/redis-cli
