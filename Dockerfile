FROM debian:latest

ENV REDIS_PORT 6379

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