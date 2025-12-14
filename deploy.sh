sudo cp deploy/nginx.conf /etc/nginx/conf.d/demo.conf -f

sudo service nginx restart

sudo docker compose build --print
sudo docker compose up -d

sleep 30
sudo docker ps
sudo docker compose exec --user root php-fpm composer install --no-interaction
sudo docker compose exec --user php-fpm php bin/console doctrine:migrations:migrate --no-interaction

sudo chown www-data:www-data . -R
