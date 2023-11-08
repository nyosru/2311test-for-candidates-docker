dev:
	cp .env-for-prod .env

	cp caddy/dev.Caddyfile caddy/Caddyfile
	cp docker-compose.local.yml docker-compose.yml

	docker-compose up -d
	make caddy_refresh_cfd

	make start_2311test

prod:
	cp caddy/prod.Caddyfile caddy/Caddyfile
	cp docker-compose.prod.yml docker-compose.yml

	docker-compose up -d
	make caddy_refresh_cfd

	make start_2311test

start_2311test:
	docker exec 2311test composer i
# docker exec 2311test php artisan migrate

caddy_refresh_cfd:
	docker exec -w /etc/caddy caddy caddy reload
