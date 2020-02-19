# phpphadmin docker image

A very simple phppgadmin docker image that uses the latest official release (7.12.0+) and runs on PHP 7 with Alpine.

## Usage

```
docker run -p 8080:8080 naturalis/phppgadmin:latest
```

### Environmental variables

* This image expose the following port

| Port           | Usage                |
| -------------- | -------------------- |
| 80             | HTTP web application |

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
