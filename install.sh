#!/bin/bash -e

# install python prereqs
add-apt-repository -y ppa:fkrull/deadsnakes
apt-get update
sudo dpkg --remove --force-depends libmysqlclient18
sudo apt-get install libmysqlclient18
apt-get install -y libxml2 libxml2-dev libxslt1.1 libxslt1-dev libffi-dev libssl-dev libpq-dev
sudo apt-get install libmysqlclient-dev
#!/bin/bash
for file in /u12pytpls/version/*;
do
  $file
done
