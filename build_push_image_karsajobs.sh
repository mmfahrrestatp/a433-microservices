#! /usr/bin/env bash

# echo every bash command
set -x

# Build Image
docker build -t karsajobs:latest .

# List all created images
docker images

echo "Authentication script created outside git repo, make sure to run/source it before execute further script"
# export PASSWORD_DOCKER_HUB=dockerpassword/token
echo $PASSWORD_DOCKER_HUB | docker login -u $USERNAME_DOCKER --password-stdin
echo $PASSWORD_GITHUB_PAT | docker login ghcr.io -u $USERNAME_GITHUB --password-stdin


# Change tag before push image
# docker tag karsajobs:latest docker.io/$USERNAME_DOCKER/karsajobs:latest
docker tag karsajobs:latest ghcr.io/$USERNAME_GITHUB/karsajobs:latest

# Push image
# docker push docker.io/$USERNAME_DOCKER/karsajobs:latest
docker push ghcr.io/$USERNAME_GITHUB/karsajobs:latest