#!/bin/bash -e

VERSION=2.2.1

# Make sure Java is installed
java_version=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
if [[ -z "$java_version" ]]; then
  echo "ElasticSearch needs Java to be installed on your system. Exiting."
  exit 1
fi

# Install prerequisites
sudo apt-get install -y lsof

# Install Neo4j
sudo wget --content-disposition http://neo4j.com/artifact.php?name=neo4j-community-${VERSION}-unix.tar.gz
sudo tar xzf neo4j-community-${VERSION}-unix.tar.gz -C /usr/local
sudo rm -f neo4j-community-${VERSION}-unix.tar.gz
sudo ln -s /usr/local/neo4j-community-${VERSION}/bin/neo4j /usr/local/bin/neo4j
