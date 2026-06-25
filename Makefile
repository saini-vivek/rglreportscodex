DOCKER_COMPOSE ?= docker compose

.PHONY: up down build install key migrate shell npm-build test logs

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

build:
	$(DOCKER_COMPOSE) build

install:
	$(DOCKER_COMPOSE) run --rm app composer install
	$(DOCKER_COMPOSE) run --rm node npm install

key:
	$(DOCKER_COMPOSE) exec app php artisan key:generate

migrate:
	$(DOCKER_COMPOSE) exec app php artisan migrate

shell:
	$(DOCKER_COMPOSE) exec app sh

npm-build:
	$(DOCKER_COMPOSE) run --rm node npm run build

test:
	$(DOCKER_COMPOSE) exec app php artisan test

logs:
	$(DOCKER_COMPOSE) logs -f
