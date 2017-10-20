#!/bin/bash

#Update sources list and upgrade any exsisting packages
sudo apt-get update -y
sudo apt-get upgrade -y

#install nginx
sudo apt-get install nginx -y

#install nodejs
curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install nodejs -y
sudo npm install -g pm2

#Adds app user and group
# sudo adduser --disabled-password --gecos "" app
# sudo chown -R app:app /home/ubuntu/app
sudo unlink /etc/nginx/sites-enabled/default
sudo cp /home/ubuntu/DevOps/environment/app/reverse-proxy.conf /etc/nginx/sites-available
sudo cp /home/ubuntu/environment/app/reverse-proxy.conf /etc/nginx/sites-available
sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
sudo service nginx configtest
sudo service nginx restart