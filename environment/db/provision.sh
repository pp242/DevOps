#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y
sudo locale-gen en_GB.UTF-8
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo cp /home/ubuntu/environment/db/mongodb.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl start mongod
sudo systemctl enable mongod

sudo rm /etc/mongod.conf
sudo cp /home/ubuntu/environment/db/mongod.conf /etc

sudo service mongod restart