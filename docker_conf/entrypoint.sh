#!/bin/bash


# Warn
if [ $RUN_MODE == "prod" -o $RUN_MODE == "production" ]; then
    echo "* Running container in production mode"
else
    echo "* Running container in dev mode"
fi


## Install/Update npm packages
if [ -f /var/www/html/package.json ]; then
    if [ ! -f /var/www/html/package-lock.json ]; then
        echo "* Downloading npm packages"
        /usr/local/bin/npm install --save $NPM_DEPS
    elif [ $NPM_UPDATE == 1 ]; then
        echo "* Updating npm packages"
        /usr/local/bin/npm update
    fi

    # Run npm based on run mode
    if [ $RUN_MODE == "prod" -o $RUN_MODE == "production" ]; then
        /usr/local/bin/npm run prod
    elif [ $RUN_NPM_WATCH == 1 ]; then
        /usr/local/bin/npm run watch &
    fi
fi


# Run simple php
echo "* Almost ready, starting node http-server"
mkdir -p /var/www/html/public
exec http-server -p $SERVER_PORT
