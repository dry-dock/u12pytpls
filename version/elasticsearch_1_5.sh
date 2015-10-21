#!/bin/bash -e

VERSION=1.5.1

# Make sure Java is installed
java_version=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
if [[ -z "$java_version" ]]; then
  echo "ElasticSearch needs Java to be installed on your system. Exiting."
  exit 1
fi

# Install ElasticSearch
sudo wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-${VERSION}.tar.gz
sudo tar xzf elasticsearch-${VERSION}.tar.gz -C /usr/local && sudo rm -f elasticsearch-${VERSION}.tar.gz
sudo ln -s /usr/local/elasticsearch-${VERSION}/bin/elasticsearch /usr/local/bin/elasticsearch

# Start elasticsearch
sudo elasticsearch &

# Make sure service is running
curl http://localhost:9200
