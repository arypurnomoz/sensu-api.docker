# Requirements:
  - ssl dir with cert.pem and key.pem
  - REDIS_HOST env
  
```sh
  docker run \
    -v /ssl:/ssl \
    -e RABBITMQ_HOST=redis.local \
    arypurnomoz/sensu-server
```
