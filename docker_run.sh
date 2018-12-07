#!/usr/bin/env bash

usage()
{
    echo "usage: $(basename $0) [OPTIONS]"
    echo ""
    echo "Run a Docker container with source and build directories mounted"
    echo ""
    echo "Configure with a .env file or environment variables"
    echo "Unrecognized options are passed to 'docker run'"
    echo ""
    echo "Options:"
    echo "  -E, --script-env string     Location of environment file"
    echo "  -h, --help                  This help text"
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

# Parse command-line arguments
options=()
positional_args=()
while [[ $# -gt 0 ]]; do
    arg="$1"
    case $arg in
        -E|--script-env)
            env_file="$2"
            shift
            shift
            ;;
        --script-env=*)
            # Substring removal - remove up to and including the '='
            env_file="${arg#*=}"
            shift
            ;;
        -h|--help)
            usage
            exit 1
            ;;
        -*)
            # Store options to pass to docker run
            echo $1
            echo $2
            options+=("$1")
            options+=("$2")
            echo ${options[@]}
            shift
            shift
            ;;
        *)
            # Store positional args to pass to docker run
            positional_args+=("$1")
            shift
            ;;
    esac
done

if [[ -r "${env_file}" ]]; then
    echo "Reading env file: ${env_file}"
	source ${env_file}
else
    echo 'Not reading env file'
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
echo "Options: ${options[@]}"
echo "Arguments: ${positional_args[@]}"
echo ""
command="docker run \
    --rm --name ${container_name} \
    --interactive --tty \
    --user ${userid}:${groupid} \
    --mount type=bind,src=${src_path_host},dst=${src_path_target} \
	--mount type=bind,src=${build_path_host},dst=${build_path_target} \
    --workdir ${build_path_target} \
    ${options[@]}
	${image_name}
    ${positional_args[@]}"
echo ${command}
#${command}
