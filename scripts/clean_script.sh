#!/bin/bash -xe

# echo
# DIR_1="resource_group"
# CLEAN_LIST=".terraform .terraform.lock.hcl errored.tfstate terraform.tfstate terraform.tfstate.backup tg_backend.tf"

# echo
# rm -fv .env
# rm -fv tg_backend.tf

# echo
# # DIR_1
# for DIR in ${DIR_1}; do echo "CLEAN ${DIR}"; cd ${DIR} ; for CLEAN in ${CLEAN_LIST}; do rm -frv ${CLEAN}; done; cd .. ; echo ; done

# docker
if [ $(docker ps -a -q | wc -l) -gt 0 ]; then docker stop $(docker ps -a -q) ; docker rm $(docker ps -a -q) ; fi
if [ $(docker image ls -a -q | wc -l) -gt 0 ]; then docker rmi $(docker image ls -q) --force ; fi
