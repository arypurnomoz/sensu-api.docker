# Requirements:
- ssl dir with cert.pem and key.pem
- REDIS_HOST & RABBITMQ_HOST env
  
```sh
  docker run \
    -v /ssl:/ssl \
    -v /conf.d:/conf.d \
    -e RABBITMQ_HOST=redis.local \
    -e REDIS_HOST=redis.local \
    arypurnomoz/sensu-server
```
