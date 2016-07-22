#!/usr/bin/env bash

echo 'Starting Provisioner for: lb1'
sudo apt-get update
sudo apt-get install -y nginx
sudo service nginx stop
sudo rm -rf /etc/nginx/sites-enabled/default
sudo touch /etc/nginx/sites-enabled/default

echo "upstream testapp {
	server 10.0.0.11;
	server 10.0.0.12;
	server 10.0.0.13;
	server 10.0.0.14;
}

server {
	listen 80 default_server;
	listen [::]:80 default_server ipv6only=on;

	root /usr/share/nginx/html;
	index index.html index.htm;

	server_name localhost;

	location / {
		proxy_pass http://testapp;
	}
}" >> /etc/nginx/sites-enabled/default

sudo service nginx start
echo "Machine: lb1" >> /usr/share/nginx/html/index.html
echo 'Provisioning for lb1 complete!'
