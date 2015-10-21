#!/bin/bash -e

# Install Java
sudo apt-get install -y openjdk-6-jdk
echo 'export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64' >> $HOME/.bashrc
echo 'export PATH=$PATH:/usr/lib/jvm/java-6-openjdk-amd64/jre/bin' >> $HOME/.bashrc
. $HOME/.bashrc

# Install sbt
sudo wget http://repo.typesafe.com/typesafe/ivy-releases/org.scala-tools.sbt/sbt-launch/0.11.2/sbt-launch.jar
sudo mv sbt-launch.jar /usr/local/bin/sbt-launch.jar
sudo echo 'SBT_OPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"' > /usr/local/bin/sbt
sudo echo 'java $SBT_OPTS -jar `dirname $0`/sbt-launch.jar "$@"' >> /usr/local/bin/sbt
sudo chmod +x /usr/local/bin/sbt

# Install kestrel
sudo git clone https://github.com/robey/kestrel /usr/local/kestrel
cd /usr/local/kestrel
sbt clean update package-dist

# Run kestrel
/usr/local/kestrel/dist/kestrel/scripts/devel.sh
