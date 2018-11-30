# Compile with docker-compose

This project can be built and run using docker-compose.


## Background

The provided `docker-compose.yml` file will create and run a container that has CMake and gcc installed. This container runs in the background with the source and build directories bind-mounted to it, allowing you `exec` various `make` commands in the container.

Source code and build results persist on the host with the permissions that you specify.


## Prerequesites

  * Docker v17.05
  * docker-compose v1.22


## Setup

All setup and build commands should be run from the docker directory:

```
$ cd docker
```

You may run docker-compose commands manually but it is easier to use the provided Makefile:
```
$ cp Makefile-docker-compose Makefile
```

This Makefile uses several environment variables to allow system-specific paths
to the source and build directories.

Create a `.env` file:
```
$ cp example.env .env
```

Edit `.env` to be appropriate to your system.
Note that docker-compose requires absolute paths.


## Start Docker Container

Build and start the container:
```
$ make up
```

This runs the container in the background. Further `make` commands
will attach to this container.


## Compile Source

Configure the project's build system using:
```
$ make cmake
```

This generates the build system in your build directory
from the `CMakeLists.txt` file in the source directory.
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


## Stop the Docker Container

When finished, stop or tear down the container:
```
$ make stop
# or
$ make down
```
