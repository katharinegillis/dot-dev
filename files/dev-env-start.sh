#!/usr/bin/env bash

if [ -d $HOME/utils/traefik ]; then
  cd $HOME/utils/traefik
  dc up -d
fi

if [ -d $HOME/utils/dnsmasq ]; then
  cd $HOME/utils/dnsmasq
  dc up -d
fi

touch $HOME/.dev-env.lock