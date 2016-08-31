#!/bin/bash

. dockerfile-build-functions.sh

mkdir -p bin
cp ../../bin/development-environment-setup bin

dockerfile_build_image shun/devel "$@"
