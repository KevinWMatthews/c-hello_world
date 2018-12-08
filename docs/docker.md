---
layout: page
title: docker
---


Use docker to compile, build, and run.


## Background

The provided `Dockerfile` will build a Docker image that has CMake and gcc installed.
The resulting container can then execute `make` commands.

The source and build directories are bind-mounted to this container,
which allows your changes to be detected by the container without rebuilding
the image. It also allows build results to persist on the host
(with the permissions that you specify).


## Prerequisites

  * Docker v17.05+


## Setup

How to build and run the Docker image.


### Build Docker Image

Build the Docker image that is the basis for containers:
```bash
# docker build --tag <image_name> <relative/path/to/dockerfile/dir>
$ docker build --tag gcc8-cmake:3.13.1 Dockerfiles/
```

For more information, see `docker build --help`.

The base [docker-gcc](https://hub.docker.com/_/gcc/) image is fairly large,
but all subsequent builds can reuse this image.


### Run Docker Container

A docker image can be run simply using `docker run <image_name>`, but we want
to customize several aspects of this container.

This can be done by hand each time the container is run, or use the provided
helper script with an environment file.

Create a `.env` file:
```bash
$ cp example.env .env
```

Edit `.env` to be appropriate to your system.
Note that Docker requires absolute paths.

Run the container using:
```bash
# ENV_FILE=<env_file> ./docker_run.sh <image_name>
$ ENV_FILE=.env ./docker_run.sh gcc8-cmake:3.13.1
```

Any options that are passed to `docker_run.sh` are passed directly to `docker run`,
excepting `--help`.


## Compile and Run

Once within the container, compile the source as usual.

Configure the project's build system using:
```bash
# cmake <path/to/source>
$ cmake ../hello_world
```

Compile the project using:
```bash
$ make
```

Run the resulting executable using:
```bash
# ./bin/<your_executable>
$ ./bin/hello_world
Hello, World!
```

When finished, stop the container using:
```bash
$ exit
```
