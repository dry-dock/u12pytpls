#!/bin/bash -e

# Install dependencies
sudo apt-get install -y \
  build-essential \
  libc6-dev-i386 \
  libncurses5-dev \
  openssl \
  libssl-dev \
  fop \
  xsltproc \
  unixodbc-dev \
  libwxbase2.8 \
  libwxgtk2.8-dev \
  libqt4-opengl-dev \
  libpam-dev

# Install erlang
sudo wget http://s3.amazonaws.com/downloads.basho.com/erlang/otp_src_R16B02-basho5.tar.gz
sudo tar xzf otp_src_R16B02-basho5.tar.gz
cd otp_src_R16B02-basho5
./configure && make && sudo make install
cd .. && sudo rm -rf otp_src_*

# Install Riak
sudo wget http://s3.amazonaws.com/downloads.basho.com/riak/2.0/2.0.5/riak-2.0.5.tar.gz
sudo tar xzf riak-2.0.5.tar.gz
cd riak-2.0.5
make rel

# Add to path
echo 'export PATH=$PATH:/riak-2.0.5/rel/riak/bin' >> $HOME/.bashrc
. $HOME/.bashrc
