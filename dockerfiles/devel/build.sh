#!/bin/bash

. dockerfile-build-functions.sh

mode=$1

dockerfile_build_pre(){
  if [ -n "$mode" ]; then
    sed -i "s/^# VERSION for docker :.*/# VERSION for docker : $version/" bin/development-environment-setup
  fi
}
dockerfile_build_post(){
  if [ -f $HOME/.docker_buildrc ]; then
    . $HOME/.docker_buildrc
    if [ -n "$DOCKER_BUILD_REGISTRY" ]; then
      dockerfile_build_push $DOCKER_BUILD_REGISTRY
    fi
  fi
}

dockerfile_build_image shun/devel "$@"
