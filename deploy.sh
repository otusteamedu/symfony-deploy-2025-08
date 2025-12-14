#!/usr/bin/bash

#[[ $(sudo docker ps -q| wc -c) -ne 0 ]] && sudo docker rm -f $(sudo docker ps -q)
if [[ $(sudo docker ps -q| wc -c) -ne 0 ]]; then
  sudo docker rm -f $(sudo docker ps -q)
fi

sudo cp deploy/nginx.conf /etc/nginx/conf.d/demo.conf -f

sudo service nginx restart

sudo docker compose build
sudo docker compose up -d

sleep 10
docker ps

sudo docker compose exec --user root php-fpm php composer install --no-interaction
sudo docker compose exec --user root php-fpm php bin/console doctrine:migrations:migrate --no-interaction

sudo chown www-data:www-data . -vR

