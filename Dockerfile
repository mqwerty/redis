FROM redis:6-alpine
RUN addgroup -S -g 3000 app && adduser --uid 3000 -G app -SDH app \
    && mkdir /socks && chown app:app /socks && chmod 0775 /socks && addgroup redis app
COPY ./conf/redis.conf /etc/redis/redis.conf
CMD ["redis-server", "/etc/redis/redis.conf"]
