#! /usr/bin/env bash

# echo every bash command
set -x

# Build Image
docker build -t shipping-service:latest .

# List all created images
docker images

echo "Authentication script created outside git repo, make sure to run/source it before execute further script"
# export PASSWORD_DOCKER_HUB=dockerpassword/token
echo $PASSWORD_DOCKER_HUB | docker login -u $USERNAME_DOCKER --password-stdin
echo $PASSWORD_GITHUB_PAT | docker login ghcr.io -u $USERNAME_GITHUB --password-stdin


# Change tag before push image
# docker tag shipping-service:latest docker.io/$USERNAME_DOCKER/shipping-service:latest
docker tag shipping-service:latest ghcr.io/$USERNAME_GITHUB/shipping-service:latest

# Push image
# docker push docker.io/$USERNAME_DOCKER/shipping-service:latest
docker push ghcr.io/$USERNAME_GITHUB/shipping-service:latest