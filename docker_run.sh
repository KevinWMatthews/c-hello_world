#!/usr/bin/env bash

# This script sets default values for variables using shell parameter expansion.
# See https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html

image_name=${IMAGE_NAME:=$(basename "$PWD")}
container_name=${CONTAINER_NAME:=$IMAGE_NAME}

userid=${USERID:=$(id --user)}
groupid=${GROUPID:=$(id --group)}

src_path_host=${SRC_PATH_HOST:=${PWD}/c_hello_world}
build_path_host=${BUILD_PATH_HOST:=${PWD}/build_c_hello_world}
src_path_target=${SRC_PATH_TARGET:=/usr/src/c_hello_world}
build_path_target=${BUILD_PATH_TARGET:=/usr/src/build_c_hello_world}

docker run \
    --rm --name ${container_name} \
    --interactive --tty \
    --user ${userid}:${groupid} \
    --mount type=bind,src=${src_path_host},dst=${src_path_target} \
	--mount type=bind,src=${build_path_host},dst=${build_path_target} \
    --workdir ${build_path_target} \
	${image_name}
