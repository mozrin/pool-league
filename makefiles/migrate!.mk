migrate!: # Run php artisan db:wipe and then migrate
	@docker compose run --rm artisan db:wipe
	@docker compose run --rm artisan migrate
