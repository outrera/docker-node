
FROM php:7.1

# Install node and npm
ENV PATH=/usr/local/etc/nodejs/bin:$PATH

ADD https://nodejs.org/dist/v8.2.1/node-v8.2.1-linux-x64.tar.xz /tmp
RUN mv /tmp/node-v8.2.1-linux-x64 /usr/local/etc/nodejs; \
    ln -s /usr/local/etc/nodejs/bin/node /usr/local/bin/node; \
    ln -s /usr/local/etc/nodejs/bin/npm /usr/local/bin/npm
