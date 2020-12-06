#!/usr/bin/env bash

if [ -d $HOME/utils/traefik ]; then
  cd $HOME/utils/traefik
  docker-compose down
fi

if [ -d $HOME/utils/dnsmasq ]; then
  cd $HOME/utils/dnsmasq
  docker-compose down
fi

rm -rf $HOME/.dev-env.lock