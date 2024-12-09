FROM redis/redis-stack

LABEL maintainer="Mahmoud Zalt <mahmoud@zalt.me>"

## For security settings uncomment, make the dir, copy conf, and also start with the conf, to use it
RUN mkdir -p /usr/local/etc/redis
COPY redis.conf /usr/local/etc/redis/redis.conf
COPY sysctl.conf /etc/sysctl.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh

VOLUME /data

EXPOSE 6379

ENTRYPOINT ["/start.sh"]
