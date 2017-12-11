#!/usr/bin/env sh

while ! mysqladmin ping -h ${DB_HOST} --password=${DB_PASS} --user=${DB_USER} --silent; do
    echo "Waiting for mysql..."
    sleep 1
done

echo "migrate $*"

migrate $*
