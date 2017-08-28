
FROM node:latest


ENV RUN_MODE="prod" \
    SERVER_ROOT="/var/www/html" \
    SERVER_PORT=80 \
    PUBLIC_FOLDER=public

# Install http-server
RUN /usr/local/bin/yarn global add http-server

# Copy configuration to guest container
ADD ./docker_conf /tmp/conf
RUN chmod +x /tmp/conf/entrypoint.sh

# Expose $SERVER_PORT port
EXPOSE $SERVER_PORT

# Set the working directory to $SERVER_ROOT
WORKDIR $SERVER_ROOT


CMD ["/tmp/conf/entrypoint.sh"]
