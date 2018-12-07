#!/usr/bin/env bash

usage()
{
	echo "usage: $(basename $0) [IMAGE_NAME] [DOCKERFILE_DIR]"
}

if [[ $# -ne 2 ]]; then
	usage
	exit 1
fi

image_name="$1"
dockerfile_dir="$2"

command="docker build --tag ${image_name} ${dockerfile_dir}"
echo "Building docker image '${image_name}' from Dockerfile in '${dockerfile_dir}':"
echo "${command}"
${command}