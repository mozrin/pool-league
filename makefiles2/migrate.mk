migrate: # Run php artisan migrate
	@docker compose run --rm artisan migrate
