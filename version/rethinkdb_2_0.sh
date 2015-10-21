#!/bin/bash -e

VERSION=2.0.1

# Install the dependencies
sudo apt-get install -y \
  m4 \
  build-essential \
  protobuf-compiler \
  python \
  libprotobuf-dev \
  libcurl4-openssl-dev \
  libboost-all-dev \
  libncurses5-dev \
  libjemalloc-dev 

# Install RethinkDB
sudo wget http://download.rethinkdb.com/dist/rethinkdb-${VERSION}.tgz
sudo tar xzf rethinkdb-${VERSION}.tgz
cd rethinkdb-${VERSION}
./configure --allow-fetch
make && sudo make install
cd .. && sudo rm -rf rethinkdb-*

# Start the service
# rethinkdb
