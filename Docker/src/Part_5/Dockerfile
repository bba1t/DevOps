FROM nginx:latest

USER root

WORKDIR /home/

COPY /nginx/nginx.conf /etc/nginx/nginx.conf
COPY server.c /home/server.c
COPY dock.sh /home/dock.sh

RUN apt-get clean && rm -rf /var/lib/apt/lists/*; \
  apt-get update; \
  apt-get install -y gcc spawn-fcgi libfcgi-dev; \
  useradd janinemu; \
  chown -R janinemu:janinemu /etc/nginx/nginx.conf; \
  chown -R janinemu:janinemu /home; \
  chown -R janinemu:janinemu /var/cache/nginx/; \
  chmod 777 /var/run

USER newttena

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1