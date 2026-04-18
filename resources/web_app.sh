#!/bin/bash +xe
echo "Installing Docker (CE) on Web App Ubuntu 18.04 host"
lsb_release -r

apt update -y

pkill java*

echo "Installing Maven"
apt update -y
apt install -y maven
mvn -version

echo "Install and start web app"
git clone https://github.com/davidjeddy/spring-petclinic.git
chown ubuntu:ubuntu ./spring-petclinic
cd spring-petclinic
git checkout feature/selenium_test_addition
mvn install -DskipTests

# Run java web app in a screen session
screen -d -m bash -c "java -jar target/*.jar"

echo "...please wait a couple seconds while the application start."