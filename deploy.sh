sudo rm /etc/nginx/sites-enabled/default


sudo cp deploy/nginx.conf /etc/nginx/conf.d/demo.conf -f

#sudo cp deploy/supervisor.conf /etc/supervisor/conf.d/demo.conf -f
#sudo sed -i -- "s|%SERVER_NAME%|$1|g" /etc/nginx/conf.d/demo.conf
sudo service nginx restart
sudo docker compose up -d --progress=plain
sudo docker compose exec -T php-fpm php composer install -q
sudo docker compose exec -T php-fpm php bin/console doctrine:migrations:migrate --no-interaction
