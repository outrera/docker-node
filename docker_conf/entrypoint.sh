#!/bin/bash


# Warn
if [ $RUN_MODE == "prod" -o $RUN_MODE == "production" ]; then
    echo "* Running container in production mode"
else
    echo "* Running container in dev mode"
fi


## Install/Update node packages
if [ -f /var/www/html/package.json ]; then
    # Run npm based on run mode
    if [ $RUN_MODE == "prod" -o $RUN_MODE == "production" ]; then
        /usr/local/bin/npm run prod
    elif [ $RUN_NPM_WATCH == 1 ]; then
        /usr/local/bin/npm run watch-poll &
    fi
fi


# Run simple php
echo "* Almost ready, starting node http-server"
mkdir -p $SERVER_ROOT/public
exec http-server -p $SERVER_PORT
