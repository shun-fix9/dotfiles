#!/bin/bash

. dockerfile-build-functions.sh

build_sakai_devel_main(){
  mkdir -p bin
  cp ../../bin/development-environment-setup bin

  local repository
  repository=sakai/devel
  dockerfile_build_image "$@"
}

build_sakai_devel_main "$@"
