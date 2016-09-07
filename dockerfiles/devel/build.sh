#!/bin/bash

. dockerfile-build-functions.sh

dockerfile_build_pre(){
  if [ -n "$1" ]; then
    sed -i "s/^# VERSION for docker :.*/# VERSION for docker : $version/" bin/development-environment-setup
  fi
}

dockerfile_build_image shun/devel "$@"
