#!/usr/bin/env bash

[ ! -d "$HOME/utils" ] && mkdir $HOME/utils
    cd $HOME/utils

if ls $HOME/utils/traefik 1> /dev/null 2>&1; then
    cd $HOME/utils/traefik
    if [ -f "$HOME/.dev-env.lock" ]; then
      dc down
    fi
    git pull origin master
    if [ -f "$HOME/.dev-env.lock" ]; then
      dc up -d
    fi
else
    # Download the traefik docker
    git clone git@github.com:katharinegillis/docker-traefik.git traefik
fi

if ls $HOME/utils/dnsmasq 1> /dev/null 2>&1; then
    cd $HOME/utils/dnsmasq
    if [ -f "$HOME/.dev-env.lock" ]; then
      dc down
    fi
    git pull origin master
    if [ -f "$HOME/.dev-env.lock" ]; then
      dc up -d
    fi
else
    # Download the dnsmasq docker
    git clone git@github.com:katharinegillis/docker-dnsmasq.git dnsmasq
fi