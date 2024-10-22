FROM nginx
USER root
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./server.c /home/server.c
COPY ./dock.sh /home/dock.sh
RUN apt update && apt install -y gcc spawn-fcgi libfcgi-dev; \
    chmod +x /home/dock.sh
WORKDIR /home/
CMD ["/home/dock.sh"]