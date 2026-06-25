# RGL Reports

Project skeleton for a Laravel, React, MySQL application that can run consistently on Rocky Linux and macOS through containers.

## Prerequisites

- Git
- Docker Desktop on macOS, or Docker Engine with the Compose plugin on Rocky Linux
- Make is optional, but the included `Makefile` keeps common commands short

## First setup

```bash
cp .env.example .env
docker compose build
docker compose up -d
docker compose run --rm app composer install
docker compose run --rm node npm install
docker compose exec app php artisan key:generate
docker compose exec app php artisan migrate
```

Open the app at http://localhost:8090. Vite runs on http://localhost:5173.
MySQL is available to the Laravel container at `mysql:3306` and from your host at `127.0.0.1:3307`.

If Docker says `pull access denied for rgl-reports-app`, build the local PHP image before running commands that use the `app` service:

```bash
docker compose build app
docker compose up -d
```

With `make` available, the same flow is:

```bash
cp .env.example .env
make build
make up
make install
make key
make migrate
```

## Daily workflow

```bash
docker compose up -d
docker compose logs -f
```

Stop containers:

```bash
docker compose down
```

Run Laravel commands:

```bash
docker compose exec app php artisan migrate
docker compose exec app php artisan test
```

Run frontend commands:

```bash
docker compose run --rm node npm run build
```

## Working from two computers

1. Push this repository to GitHub from one machine.
2. Clone it on the other machine.
3. Copy `.env.example` to `.env` on each machine.
4. Run the first setup commands on each machine.

The `.env`, `vendor`, `node_modules`, and database volume are intentionally not committed. Code and configuration stay in Git; machine-specific secrets and generated dependencies stay local.
