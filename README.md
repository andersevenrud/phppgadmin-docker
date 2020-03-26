# phpphadmin docker image

A very simple phppgadmin docker image that uses the latest official release (7.12.0+) and runs on PHP 7 with Alpine.

## Usage

```
docker run -p 8080:8080 andersevenrud/phppgadmin:latest
```

### Environmental variables

* This image expose the following port

| Port           | Usage                |
| -------------- | -------------------- |
| 8080           | HTTP web application |

 * This image takes theses environnements variables as parameters

| Environment                | Usage                                                          |
| -------------------------- | ---------------------------------------------------------------|
| POSTGRES_HOST              | The hostname of the PostGreSQL database server                 |
| POSTGRES_PORT              | The port on which join the postgressql server (default to 5432)|
| POSTGRES_NAME              | The name of the connection profil in phpPgAdmin profile        |
| POSTGRES_HOSTS             | Comma separated list of hostnames                              |
| POSTGRES_PORTS             | Comma separated list of ports                                  |
| POSTGRES_NAMES             | The name of the connection profil in phpPgAdmin profile        |
| POSTGRES_DEFAULTDB         | The name of default database to show                           |
| PHPPGADMIN_LOGIN_SECURITY  | If true enable restrictions on login and empty passwords       |
| PHPPGADMIN_OWNED_ONLY      | If true, filter databases owned by the logged user             |
| PHPPGADMIN_SHOW_COMMENTS   | If true, show comments fields                                  |
| PHPPGADMIN_SHOW_ADVANCED   | If true, display advanced objects like types, aggregations     |
| PHPPGADMIN_SHOW_SYSTEM     | If true, display systems objects                               |
| PHPPGADMIN_SHOW_OIDS       | If true, show objects OIDs                                     |
| PHPPGADMIN_USE_XHTML_STRICT| If true, send XHTML strict headers                             |
| PHPPGADMIN_THEME           | Set here the name of the theme to use                          |
| PHPPGADMIN_PLUGINS         | Set here the comma separated list of plugins name to enable    |


## Usage with compose

An example setup with docker-compose, username postgres, password test:

```yaml
---
version: "3"
services:
  postgres:
    image: "postgres:12"
    environment:
      POSTGRES_PASSWORD: test
  phppgadmin:
    build: .
    environment:
      POSTGRES_HOST: postgres   # use POSTGRES_HOSTS for multiple databases
      POSTGRES_NAME: postgres   # use POSTGRES_NAMES for multiple databases
    ports:
      - 8080:8080
...
```
