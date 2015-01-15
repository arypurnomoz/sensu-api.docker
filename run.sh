#!/bin/sh

if [ -z "$REDIS_HOST" ]; then
  echo "\$REDIS_HOST must be provided" 
  exit 1
fi

cat << EOF > /etc/sensu/config.json
{
  "redis": {
    "host": "$REDIS_HOST",
    "port": $REDIS_PORT
  }, 
  "api": {
    "port": 4567,
    "user": "$API_USER",
    "password": "$API_PASS",
    "host": "0.0.0.0",
    "bind": "0.0.0.0"
  }
}
EOF

echo "Running sensu config:"
cat /etc/sensu/config.json

exec /opt/sensu/bin/sensu-api -vc /etc/sensu/config.json
