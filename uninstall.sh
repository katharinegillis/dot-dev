#!/usr/bin/env bash

# Remove the traefik docker
cd $HOME/utils/traefik
docker-compose down
cd $HOME
rm -rf $HOME/utils/traefik