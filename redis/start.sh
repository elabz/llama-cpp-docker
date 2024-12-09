#!/bin/bash
# Start Redis
redis-server /usr/local/etc/redis/redis.conf \
  --save "" \
  --appendonly yes \
  --appendfsync everysec \
  --loglevel warning \
  --protected-mode no \
  --loadmodule /opt/redis-stack/lib/redisearch.so \
  --loadmodule /opt/redis-stack/lib/rejson.so
