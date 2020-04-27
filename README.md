# README

This README would normally document whatever steps are necessary to get your application up and running.

## What is this repository for?

A bitbucket pipeline image for git repositories.

## How do I get set up?

- docker pull cheanan/bitbucket-pipeline:latest
- docker run -it cheanan/bitbucket-pipeline bash

## How do I build it from the `Dockerfile`?

- `cd <Dockerfile-directory>`
- docker build -t cheanan/bitbucket-pipeline:latest .

Note the . is very important

## Display Docker version and info

docker --version
docker version
docker info

## List Docker images

docker image ls

## List Docker containers (running, all, all in quiet mode)

docker container ls
docker container ls --all
docker container ls -aq

## Useful docker commands?

- See all containers `docker ps -a`
- Remove all docker containers `docker rm $(docker ps -aq)`
- List all docker images on your system `docker images`
- Remove all images from your machine `docker rmi $(docker images -q)`
- Running low on space? Prune your docker space on your machine `docker system prune --all`
