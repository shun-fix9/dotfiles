#!/bin/bash

. dockerfile-build-functions.sh

mkdir -p bin
cp ../../bin/development-environment-setup bin

dockerfile_build_pre(){
  if [ -n "$1" ]; then
    sed -i "s/^# VERSION :.* : for docker$/# VERSION : $version : for docker/" bin/development-environment-setup
  fi
}

dockerfile_build_image shun/devel "$@"
