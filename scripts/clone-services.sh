#!/bin/bash

services=(friendroom.api friendroom.auth friendroom.front friendroom.uikit)

cd services

for service in ${services[*]}
do
  git clone "git@github.com:Nikitonu4/$service.git" -b master
  cd $service
  cd app
#  npm i TODO
done
