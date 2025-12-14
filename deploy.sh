sudo cp deploy/nginx.conf /etc/nginx/conf.d/demo.conf -f

sudo service nginx restart
sudo cd /app

sudo docker compose up -d --progress=plain
sudo docker compose exec -T php-fpm php composer install -q
sudo docker compose exec -T php-fpm php bin/console doctrine:migrations:migrate --no-interaction
