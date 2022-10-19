#!/bin/bash
set -eu

echo "Install wget, ant, maven, gradle"
sudo yum install -y wget
sudo yum install -y ant
sudo yum install -y maven
#curl -s "https://get.sdkman.io" | bash
#source "/home/vagrant/.sdkman/bin/sdkman-init.sh"
#sdk install gradle 

echo "Install docker-compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose || true
docker-compose --version
