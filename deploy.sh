#!/usr/bin/bash

if [[ $(sudo docker ps -q| wc -c) -ne 0 ]]; then
  echo "Docker: removing containers"
  sudo docker composer stop --remove-orphans
  sudo docker rm -f $(sudo docker ps -q)
fi

sudo cp deploy/nginx.conf /etc/nginx/conf.d/demo.conf -f

echo "Restarting nginx"
sudo service nginx restart

echo "Docker: build containers"
sudo docker compose build

echo "Docker: up containers"
sudo docker compose up -d

echo "Waiting 10 seconds"
sleep 10
docker ps

echo "Installing dependencies"
sudo docker compose exec --user root php-fpm composer install --no-interaction

echo "Up migrations"
sudo docker compose exec --user root php-fpm php bin/console doctrine:migrations:migrate --no-interaction

echo "Chown for files"
sudo chown www-data:www-data . -R
