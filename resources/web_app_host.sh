#!/bin/bash +xe
echo "Installing Docker (CE) on Web App Ubuntu 18.04 host"
lsb_release -r

echo "Installing Maven"
apt update -y
apt install -y maven
mvn -version

echo "Install and start web app"
git clone https://github.com/davidjeddy/spring-petclinic.git
cd spring-petclinic
git checkout feature/selenium_test_addition
nohup java -jar target/*.jar &

echo "Execute Selenium test"
sudo mvn test \
-Dtest=SeleniumExampleTest \
-DSG_FQDN=${terraform output "Selenium Grid Public DNS"} \
-DWEB_APP_FQDN=${terraform output "Web App Public DNS"}
