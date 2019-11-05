#
# A very basic phppgadmin docker image
#

FROM php:7-alpine

LABEL description="A very basic phppgadmin docker image"
LABEL maintainer="andersevenrud@gmail.com"
LABEL version="7.12.0"

ARG PGADMIN_VERSION=7.12.0

ENV PGADMIN_NAME pgadmin
ENV PGADMIN_HOSTNAME localhost
ENV PGADMIN_PORT 5432

RUN apk add --no-cache wget postgresql-dev

RUN docker-php-ext-install pgsql pdo pdo_pgsql

RUN wget https://github.com/phppgadmin/phppgadmin/releases/download/REL_`echo "${PGADMIN_VERSION}" | sed "s/\./-/g"`/phpPgAdmin-${PGADMIN_VERSION}.tar.bz2 && \
    tar xjvf phpPgAdmin-${PGADMIN_VERSION}.tar.bz2

WORKDIR "phpPgAdmin-${PGADMIN_VERSION}"
RUN cp conf/config.inc.php-dist conf/config.inc.php && \
  sed -i "s/\[\'desc\'\] = \'PostgreSQL\';/[\'desc\'] = getenv(\'PGADMIN_NAME\');/g" conf/config.inc.php && \
  sed -i "s/\[\'host\'\] = \'\';/[\'host\'] = getenv(\'PGADMIN_HOSTNAME\');/g" conf/config.inc.php && \
  sed -i "s/\[\'port\'\] = 5432;/[\'port\'] = getenv(\'PGADMIN_PORT\');/g" conf/config.inc.php

CMD php -S 0.0.0.0:8080
