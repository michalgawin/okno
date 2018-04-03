FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD=root \
    MYSQL_DATABASE=okno \
    MYSQL_USER=user \
    MYSQL_PASSWORD=haslo

COPY ./docker_assets/db/backupoknodb.sql /docker-entrypoint-initdb.d/

EXPOSE 3306
