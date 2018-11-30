# c_hello_world

Print `Hello, World!` using C.

Compile with your [system's tools](system-tools.md),
a [Docker container](docker.md), or [docker-compose](docker-compose.md).


## Getting Started

These instructions outline several ways that this project can be built and run.


### Prerequisites

  * CMake 3.5.1
  * gcc

or
  * Docker
  * docker-compose (optional)


### Background

The build system for this project is configured using CMake.
It was designed for an out-of-tree build - build artifacts do not linger in the source directory.
For your convenience, an out-of-tree build directory already exists.

The directory structure is as follows:

```bash
c_hello_world
├── build_c_hello_world
├── c_hello_world
├── docker
```

In detail,
  * `c_hello_world/` contains the source code.
  * `build_c_hello_world/` will hold build artifacts. `make` commands should be run here.
  * `docker/` contains files for Docker and docker-compose, should you choose to use them.

### Build Instructions

See one of the following:

  * [system tools](system-tools.md)
  * [Docker](docker.md)
  * [docker-compose](docker-compose.md)
