#!/usr/bin/env bash

if [ -d $HOME/utils/traefik ]; then
  cd $HOME/utils/traefik
  docker-compose up -d
fi

if [ -d $HOME/utils/dnsmasq ]; then
  cd $HOME/utils/dnsmasq
  docker-compose up -d
fi

touch $HOME/.dev-env.lock