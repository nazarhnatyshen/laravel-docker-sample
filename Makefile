#!/usr/bin/make

include Make.config

.DEFAULT_GOAL := list

IN_APP=docker-compose exec $(app_service)

.PHONY: list
list:
	@echo ">>> docker commands:"
	@echo "	docker_build        > build all services"
	@echo "	docker_up           > start services"
	@echo "	docker_down         > stop services"
	@echo ""
	@echo ">>> composer commands:"
	@echo "	composer_install    > install all dependencies"
	@echo ""
	@echo ">>> database:"
	@echo "	db_migrate      	> run migrations for all databases"

.PHONY: composer_install
composer_install:
	$(IN_APP) $(composer) install --no-suggest

.PHONY: docker_up
docker_up:
	docker-compose up -d

.PHONY: docker_down
docker_down:
	docker-compose down

.PHONY: docker_build
docker_build:
	docker-compose build --no-cache --parallel --force-rm --compress

.PHONY: db_migrate
db_migrate:
	$(IN_APP) $(artisan) migrate
