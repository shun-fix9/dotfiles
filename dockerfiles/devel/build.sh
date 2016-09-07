#!/bin/bash

. dockerfile-build-functions.sh

mode=$1

dockerfile_build_pre(){
  sed -i "s/^# VERSION for docker :.*/# VERSION for docker : $version/" bin/development-environment-setup
}

dockerfile_build_image shun/devel "$@"
