#!/bin/bash


# Warn
if [ $RUN_MODE == "prod" -o $RUN_MODE == "production" ]; then
    echo "* Running container in production mode"
else
    echo "* Running container in dev mode"
fi


# Node
if [ -f /var/www/html/yarn.lock ]; then
    # Run npm based on run mode
    if [ $RUN_MODE == "prod" -o $RUN_MODE == "production" ]; then
        /usr/local/bin/yarn run prod
    fi
fi


# Run simple php
echo "* Almost ready, starting node http-server"
PUBLIC_PATH=$SERVER_ROOT/$PUBLIC_FOLDER
mkdir -p $PUBLIC_PATH
exec http-server $PUBLIC_PATH -p $SERVER_PORT
