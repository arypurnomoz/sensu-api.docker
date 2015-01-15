#!/bin/sh

if [ -z "$REDIS_HOST" ]; then
  echo "\$REDIS_HOST must be provided" 
  exit 1
fi

cat << EOF > /etc/sensu/config.json
{
  "api": {
    "port": 4567,
    "user": "$API_USER",
    "password": "$API_PASS",
    "host": "0.0.0.0",
    "bind": "0.0.0.0"
  },
  "redis": {
    "host": "$REDIS_HOST",
    "port": $REDIS_PORT
  }, 
  "rabbitmq": {
    "ssl": {
      "cert_chain_file": "/ssl/cert.pem",
      "private_key_file": "/ssl/key.pem"
    },
    "host": "$RABBITMQ_HOST",
    "port": $RABBITMQ_PORT,
    "vhost": "$RABBITMQ_VHOST",
    "user": "$RABBITMQ_USER",
    "password": "$RABBITMQ_PASS"
  }
}
EOF

echo "Running sensu config:"
cat /etc/sensu/config.json

exec /opt/sensu/bin/sensu-api -vc /etc/sensu/config.json
