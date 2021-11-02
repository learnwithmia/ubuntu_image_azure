#!/bin/bash -xe

apt-get -y update
DEBIAN_FRONTEND=noninteractive apt-get -y install curl tzdata

# need for apt-add-repository
apt-get -y install software-properties-common

# az cli
curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# tf
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get -y install terraform

# tg
curl -L https://github.com/gruntwork-io/terragrunt/releases/download/v0.32.1/terragrunt_linux_amd64 -o /usr/local/bin/terragrunt
chmod a+x /usr/local/bin/terragrunt

# git. yeah, it's not installed.
apt-get -y install git

exec "$@"
