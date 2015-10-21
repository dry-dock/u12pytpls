#!/bin/bash -e

VERSION=1.6.1

# Add couchdb user
sudo adduser \
  --system \
  --home /usr/local/var/lib/couchdb \
  --no-create-home \
  --shell /bin/bash \
  --group --gecos \
  "CouchDB Administrator" couchdb

# Install prerequisites
sudo apt-get install -y \
  build-essential \
  erlang-base-hipe \
  erlang-dev \
  erlang-manpages \
  erlang-eunit \
  erlang-nox \
  libicu-dev \
  libmozjs185-dev \
  libcurl4-openssl-dev

# Install CouchDB
sudo wget http://mirrors.gigenet.com/apache/couchdb/source/${VERSION}/apache-couchdb-${VERSION}.tar.gz
sudo tar xzf apache-couchdb-${VERSION}.tar.gz 
cd apache-couchdb-${VERSION}
./configure 
make 
sudo make install
cd .. && sudo rm -rf apache-couchdb-*

# Postinstallation setup
sudo chown -R couchdb:couchdb /usr/local/etc/couchdb
sudo chown -R couchdb:couchdb /usr/local/var/lib/couchdb
sudo chown -R couchdb:couchdb /usr/local/var/log/couchdb
sudo chown -R couchdb:couchdb /usr/local/var/run/couchdb
sudo chmod 0770 /usr/local/etc/couchdb
sudo chmod 0770 /usr/local/var/lib/couchdb
sudo chmod 0770 /usr/local/var/log/couchdb
sudo chmod 0770 /usr/local/var/run/couchdb
sudo cp /usr/local/etc/init.d/couchdb /etc/init.d/couchdb

# Start couchdb service
sudo service couchdb start

# Check if couchdb is running
# curl http://localhost:5984
