FROM debian:latest

ENV REDIS_POST 6379

ENV RABBITMQ_PORT 5671
ENV RABBITMQ_VHOST /sensu
ENV RABBITMQ_USER sensu
ENV RABBITMQ_PASS sensu

ENV API_USER admin
ENV API_PASS admin

ADD http://repos.sensuapp.org/apt/pubkey.gpg /tmp/pubkey.gpg

RUN \
  apt-key add /tmp/pubkey.gpg \
  && echo 'deb http://repos.sensuapp.org/apt sensu main' > /etc/apt/sources.list.d/sensu.list \
  && apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y sensu

ADD run.sh /tmp/run.sh

# API
EXPOSE 4567

ENTRYPOINT ["/tmp/run.sh"]
