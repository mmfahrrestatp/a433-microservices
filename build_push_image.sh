#! /usr/bin/env bash

# https://stackoverflow.com/questions/2853803/how-to-echo-shell-commands-as-they-are-executed
# expands variables and prints a little + sign before the line.
set -x

# Build Image
docker build -t item-app:v1 .

# List all created images
docker images

echo "Authentication script created outside git repo, make sure to run it before execute further script"
# export PASSWORD_DOCKER_HUB=dockerpassword/token
# echo $PASSWORD_DOCKER_HUB | docker login -u username --password-stdin

# Change tag before push image
# docker tag item-app:v1 docker.io/mmfahrrestatp/item-app:v1
docker tag item-app:v1 ghcr.io/mmfahrrestatp/item-app:v1

# Push image
# docker push docker.io/mmfahrrestatp/item-app:v1
docker push ghcr.io/mmfahrrestatp/item-app:v1