# phpphadmin docker image

A very simple phppgadmin docker image that uses the latest official release (7.12.0+) and runs on PHP 7 with Alpine.

## Usage

```
docker run -p 8080:8080 andersevenrud/phppgadmin:latest
```

### Environmental variables

* `PGADMIN_NAME` - Display name of connection (default: pgadmin)
* `PGADMIN_HOSTNAME` - Hostname of connection (default: localhost)
* `PGADMIN_PORT` - Custom port (default: 5432)

## Usage with compose

An example setup with docker-compose:

```
version: "3"
services:
  pg:
    image: "postgres:11.0"
    environment:
      POSTGRES_DB: "test"
      POSTGRES_USER: "test"
      POSTGRES_PASSWORD: "test"
  phppgadmin:
    build: .
    env_file:
      - .env
    ports:
      - 8080:8080
```
