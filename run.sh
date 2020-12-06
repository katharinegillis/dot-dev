#!/usr/bin/env bash

[ ! -d "$HOME/utils" ] && mkdir $HOME/utils
cd $HOME/utils

if ls $HOME/utils/traefik 1> /dev/null 2>&1; then
    cd $HOME/utils/traefik
    if [ -f "$HOME/.dev-env.lock" ]; then
      dc down
    fi
    git pull origin master
    docker-compose pull
    if [ -f "$HOME/.dev-env.lock" ]; then
      dc up -d
    fi
else
    cd $HOME/utils
    # Download the traefik docker
    git clone git@github.com:katharinegillis/docker-traefik.git traefik
fi

if ls $HOME/utils/dnsmasq 1> /dev/null 2>&1; then
    cd $HOME/utils/dnsmasq
    if [ -f "$HOME/.dev-env.lock" ]; then
      dc down
    fi
    git pull origin master
    docker-compose pull
    if [ -f "$HOME/.dev-env.lock" ]; then
      dc up -d
    fi
else
    cd $HOME/utils
    # Download the dnsmasq docker
    git clone git@github.com:katharinegillis/docker-dnsmasq.git dnsmasq

    # Add .docker local urls to dnsmasq config
    echo "# .docker local urls" >> $HOME/utils/dnsmasq/dnsmasq.conf
    echo "address=/.docker/127.0.0.1" >> $HOME/utils/dnsmasq/dnsmasq.conf

    echo "\e[33mPlease ensure your DNS resolver is pointed to 127.0.0.1 as preferred.\e[0m"
fi