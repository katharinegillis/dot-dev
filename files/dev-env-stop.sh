#!/usr/bin/env bash

if [ -d $HOME/utils/traefik ]; then
  cd $HOME/utils/traefik
  dc down
fi

if [ -d $HOME/utils/dnsmasq ]; then
  cd $HOME/utils/dnsmasq
  dc down
fi

rm -rf $HOME/.dev-env.lock