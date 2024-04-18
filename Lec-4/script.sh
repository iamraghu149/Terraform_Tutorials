#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "The page was created by the ZoomOps Technology Solution" | sudo tee /var/www/html/index.html
