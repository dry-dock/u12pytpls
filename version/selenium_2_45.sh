#!/bin/bash -e

# Make sure Java is installed
java_version=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
if [[ -z "$java_version" ]]; then
  echo "ElasticSearch needs Java to be installed on your system. Exiting."
  exit 1
fi

# Install prerequisites
sudo apt-get install -y xvfb firefox unzip

# Install chrome
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -y -f
sudo rm -f google-chrome-stable_current_amd64.deb

# Install chrome driver
sudo wget http://chromedriver.storage.googleapis.com/2.13/chromedriver_linux64.zip
sudo unzip chromedriver_linux64.zip && sudo rm -f chromedriver_linux64.zip
sudo mv chromedriver /usr/local/bin/chromedriver
sudo chmod a+x /usr/local/bin/chromedriver

# Install Selenium
sudo mkdir /usr/local/selenium >/dev/null 2>&1
sudo wget http://selenium-release.storage.googleapis.com/2.45/selenium-server-standalone-2.45.0.jar -P /usr/local/selenium
