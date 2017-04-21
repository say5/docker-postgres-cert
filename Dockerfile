FROM postgres:9.5-alpine

RUN apk --update add openssl && rm -rf /var/cache/apk/*

# Add the SSL config
ADD ./ssl.conf /etc/postgresql-common/ssl.conf

RUN mkdir -p /docker-entrypoint-initdb.d

# Add create cert script
ADD ./create-certs.sh /docker-entrypoint-initdb.d/create-certs.sh
# Add the ssl config setup script
ADD ./ssl.sh /docker-entrypoint-initdb.d/ssl.sh

RUN chmod 755 /docker-entrypoint-initdb.d/*.sh
