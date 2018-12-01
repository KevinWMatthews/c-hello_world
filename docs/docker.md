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

All commands should be run from the docker directory:

```
$ cd docker
```

You may run Docker commands manually but it is easier to use the provided Makefile:
```
$ cp Makefile-docker Makefile
```

This Makefile uses several environment variables to allow system-specific paths
to the source and build directories.

Create a `.env` file:
```
$ cp example.env .env
```

Edit `.env` to be appropriate to your system.
Note that Docker requires absolute paths.


## Build Docker Image

Build the Docker image that is the basis for containers:

```
$ make build
```

The base [docker-gcc](https://hub.docker.com/_/gcc/) image is fairly large,
but all subsequent builds can reuse this image.


## Compile Source

Configure the project's build system using:
```
$ make cmake
```

This spins up a container, generates the build system in your build directory
from the `CMakeLists.txt` file in the source directory, and then exits the container.
The build system files should persist after the container exits.

Compile the project using:
```
$ make
```

Run the resulting executable using:
```
# make bin-<your_executable>
$ make bin-hello_world
Hello, World!
```

For more details, see:
```
$ make help
```
