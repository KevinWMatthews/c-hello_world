# c_hello_world

Hello World application in C, compile with CMake. Options for Docker.

## Setup

This project is configured for CMake. For your convenience, an out-of-tree build directory already exists.


### System CMake

If your system already has CMake and gcc installed, you can configure and build the project using:

```
$ cd build_c_hello_world
$ cmake ../c_hello_world
$ make all
```

Then run the resulting executable using:
```
$ ./build_c_hello_world/bin/hello_world
```

### docker-compose

This project can be built and run using docker-compose.

The provided `docker-compose.yml` file will create and run a container that has CMake and gcc installed. This container runs in the background with the source and build directories bind-mounted to it, allowing you `exec` various `make` commands in the container.

Source code and build results persist on the host with the permissions that you specify.

First, create a `.env` file so docker-compose knows where to find the source and build directories:
```
$ cp example.env .env
```

Edit `.env` to be appropriate to your system.
Note that docker-compose requires absolute paths.

You may run docker-compose commands manually or use the provided Makefile:
```
$ cp Makefile-docker-compose Makefile
```

Start the container (it runs in the background):
```
$ make up
```

Configure and compile the project using:
```
$ make cmake
$ make all
```

Run the resulting executable using:
```
# make bin-<your_executable>
$ make bin-hello_world
```

When finished, stop docker-compose:
```
$ make stop
# or
$ make down
```

### Docker

This project can be built and run using Docker.

The provided `Dockerfile` will build an image that has CMake and gcc installed. This image can be run and provided various `make` commands.

The source code and build results are bind-mounted to this container, allowing them persist on the host with the permissions that you specify.

First, create a `.env` file so docker-compose knows where to find the source and build directories:
```
$ cp example.env .env
```

Edit `.env` to be appropriate to your system.
Note that docker-compose requires absolute paths.

You may run Docker commands manually or use the provided Makefile:
```
$ cp Makefile-docker Makefile
```

Build the image:
```
$ make build
```

Configure and compile the project using:
```
$ make cmake
$ make
```

Run the resulting executable using:
```
# make bin-<your_executable>
$ make bin-hello_world
```

The container automatically exits.
