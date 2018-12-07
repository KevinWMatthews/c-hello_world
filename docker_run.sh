#!/usr/bin/env bash

usage()
{
    echo "usage: $(basename $0) [IMAGE_NAME]"
    echo ""
    echo "Run a Docker contaner with compilation tools installed"
    echo ""
    echo "Configure with a .env file, environment variables, or use default settings"
    echo ""
    echo "Environment variables"
    echo "   IMAGE_NAME         Name of the Docker image to run"
    echo "   CONTAINER_NAME     Name of the container that will be created"
    echo "   SRC_PATH_HOST      Path to the source directory on the host machine"
    echo "   BUILD_PATH_HOST    Path to the build on the host machine"
    echo "   SRC_PATH_TARGET    Path to the source directory in the container"
    echo "   BUILD_PATH_TARGET  Path to the build directory in the container"
    echo "   USERID             UID used in the container"
    echo "   GROUPID            GID used in the container"
}

if [[ -r .env ]]; then
	source .env
fi

# This script sets default values for variables using shell parameter expansion.
# See https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
default_src_dir=c_hello_world
default_build_dir=build_c_hello_world

image_name=${IMAGE_NAME:?Must specify IMAGE_NAME in .env or as environment variable}
container_name=${CONTAINER_NAME:=$IMAGE_NAME}

userid=${USERID:=$(id --user)}
groupid=${GROUPID:=$(id --group)}

src_path_host=${SRC_PATH_HOST:=${PWD}/${default_src_dir}}
build_path_host=${BUILD_PATH_HOST:=${PWD}/${default_build_dir}}
src_path_target=${SRC_PATH_TARGET:=/usr/src/${default_src_dir}}
build_path_target=${BUILD_PATH_TARGET:=/usr/src/${default_build_dir}}

echo "Running docker image '${image_name}' as '${container_name}'"
echo "Building in '$(basename ${build_path_host})'"
command="docker run \
    --rm --name ${container_name} \
    --interactive --tty \
    --user ${userid}:${groupid} \
    --mount type=bind,src=${src_path_host},dst=${src_path_target} \
	--mount type=bind,src=${build_path_host},dst=${build_path_target} \
    --workdir ${build_path_target} \
	${image_name}"
echo ${command}
${command}
