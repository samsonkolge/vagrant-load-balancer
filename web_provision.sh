#!/usr/bin/env bash

echo 'Starting provision: web'$1
sudo apt-get update
sudo apt-get install -y nginx
echo "<h1>Machine: web"$1"<h1>" >> /usr/share/nginx/html/index.html
mkdir app
echo 'Provisioning of web'$1' complete'
