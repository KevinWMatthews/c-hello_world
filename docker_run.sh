#!/usr/bin/env bash

usage()
{
    echo "usage: $(basename $0) [OPTIONS]"
    echo ""
    echo "Run a Docker container with source and build directories mounted"
    echo ""
    echo "Configure with a .env file or environment variables"
    echo ""
    echo "Options:"
    echo "  -e, --env string    Location of environment file"
    echo "  -h, --help          This help text"
    echo ""
    echo "Environment variables:"
    echo "   IMAGE_NAME         Name of the Docker image to run"
    echo "   CONTAINER_NAME     Name of the container that will be created"
    echo "   SRC_PATH_HOST      Path to the source directory on the host machine"
    echo "   BUILD_PATH_HOST    Path to the build on the host machine"
    echo "   SRC_PATH_TARGET    Path to the source directory in the container"
    echo "   BUILD_PATH_TARGET  Path to the build directory in the container"
    echo "   USERID             UID used in the container (default: current host UID)"
    echo "   GROUPID            GID used in the container (default: current host GUI)"
}

if [[ $# -gt 2 ]]; then
    usage
    exit 1
fi

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    arg="$1"
    case $arg in
        -e|--env)
            env_file="$2"
            shift
            shift
            ;;
        --env=*)
            # Substring removal - remove up to and including the '='
            env_file="${arg#*=}"
            shift
            ;;
        -h|--help)
            usage
            exit 1
            ;;
        *)
            usage
            exit 1
            ;;
    esac
done

if [[ -r "${env_file}" ]]; then
    echo "Reading env file: ${env_file}"
	source ${env_file}
else
    echo 'Not reading env fle'
fi

image_name=${IMAGE_NAME:?Must specify IMAGE_NAME as environment variable}
container_name=${CONTAINER_NAME:?Must specify CONTAINER_NAME as an environment variable}

userid=${USERID:=$(id --user)}
groupid=${GROUPID:=$(id --group)}

src_path_host=${SRC_PATH_HOST:=?Must specify SRC_PATH_HOST as environment variable}
build_path_host=${BUILD_PATH_HOST:=?Must specify BUILD_PATH_HOST as environment variable}
src_path_target=${SRC_PATH_TARGET:=?Must specify SRC_PATH_TARGET as environment variable}
build_path_target=${BUILD_PATH_TARGET:=?Must specify BUILD_PATH_TARGET as environment variable}

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
