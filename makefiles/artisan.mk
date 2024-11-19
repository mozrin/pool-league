artisan: # Run an artisan command on the docker container
	@docker compose run --rm artisan $(args)
