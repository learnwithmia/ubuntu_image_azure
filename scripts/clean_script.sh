#!/bin/bash -xe

# docker
if [ $(docker ps -a -q | wc -l) -gt 0 ]; then docker stop $(docker ps -a -q) ; docker rm $(docker ps -a -q) ; fi
if [ $(docker image ls -a -q | wc -l) -gt 0 ]; then docker rmi $(docker image ls -q) --force ; fi
