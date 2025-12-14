sudo cp deploy/nginx.conf /etc/nginx/conf.d/demo.conf -f

sudo service nginx restart

sudo docker compose build
sudo docker compose up -d

sleep 5
sudo docker ps

sleep 5
sudo docker ps

sleep 5
sudo docker ps

sudo docker compose exec --user root php-fpm composer install --no-interaction
sudo docker compose exec --user root php-fpm php bin/console doctrine:migrations:migrate --no-interaction

sudo chown www-data:www-data . -R
