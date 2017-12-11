#!/usr/bin/env sh

if [ -n "${DB_HOST}" -a -n "${DB_PORT}" ]; then
    waitforit \
        -host=${DB_HOST} \
        -port=${DB_PORT} \
        -timeout=${TIMEOUT:-60}
    if [ $? -ne 0 ]; then
        exit 1
    fi
fi

migrate $*
