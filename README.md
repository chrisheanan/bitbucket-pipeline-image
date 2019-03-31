# README

This README would normally document whatever steps are necessary to get your application up and running.

## What is this repository for?

A bitbucket pipeline image for git repositories.

## How do I get set up?

*   docker pull cheanan/dockerpipeline
*   docker run -it cheanan/dockerpipeline bash

## How do I build it from the `Dockerfile`?

*   `cd <Dockerfile-directory>`
*   docker build -t cheanan/dockerpipeline:latest .

Note the . is very important

## List Docker CLI commands

docker
docker container --help

## Display Docker version and info

docker --version
docker version
docker info

## Excecute Docker image

docker run hello-world

## List Docker images

docker image ls

## List Docker containers (running, all, all in quiet mode)

docker container ls
docker container ls --all
docker container ls -aq

## Useful docker commands?

*   `docker ps -a` see all containers
*   `docker rm $(docker ps -aq)` remove all docker containers
*   `docker images` list images
*   `docker rmi $(docker images -q)` remove all images
