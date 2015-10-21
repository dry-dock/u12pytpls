#!/bin/bash -e

# Install prerequisites
sudo apt-get install -y erlang
sudo apt-get install erlang-nox
# Install RabbitMQ
sudo wget https://www.rabbitmq.com/releases/rabbitmq-server/v3.5.1/rabbitmq-server_3.5.1-1_all.deb
sudo dpkg -i rabbitmq-server_3.5.1-1_all.deb
sudo rm -f rabbitmq-server_3.5.1-1_all.deb
