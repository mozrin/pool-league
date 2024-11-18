install: # Install Docker configuration and Laravel

	@docker compose up -d --build app
	@docker compose run --rm composer create-project laravel/laravel .
	@cp -f ./.config/laravel/.env ./src/.env
	@docker compose run --rm artisan install:api -n
	@cp -f ./.config/laravel/app/Models/User.php ./src/app/Models/
