---
layout: page
title: Hello, World - C, CMake, Docker
---

Print `Hello, World!` using C.

Configure with CMake. Run with Docker.


## Background

Configuring and compiling a project can be complex, even for a simple code base. This project illustrates three different approaches, all using CMake:

  * your [system's tools](system-tools.md)
  * a [Docker container](docker.md)
  * [docker-compose](docker-compose.md)


### Directory Structure

This project is designed to use an out-of-tree build. This prevents build artifacts from polluting the source directory.


The directory structure is:

```bash
c_hello_world
├── build_c_hello_world
├── c_hello_world
└── docker
```

In detail,

  * `c_hello_world/` contains the source code.
  * `build_c_hello_world/` will hold build artifacts.
  * `docker/` contains files for Docker and docker-compose.


### Build Instructions

For detailed build instructions, see one of the following:

  * [system tools](system-tools.md)
  * [Docker](docker.md)
  * [docker-compose](docker-compose.md)
