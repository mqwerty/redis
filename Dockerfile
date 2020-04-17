FROM redis:5

RUN addgroup --system --gid 3000 app && adduser --uid 3000 --gid 3000 --no-create-home --system app
RUN mkdir /socks && chown app:app /socks && chmod 0775 /socks && usermod -a -G app redis

COPY ./conf/.bashrc /root/.bashrc
COPY ./conf/redis.conf /etc/redis/redis.conf
CMD ["redis-server", "/etc/redis/redis.conf"]
