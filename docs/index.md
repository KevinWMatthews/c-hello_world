---
layout: page
title: Hello, World - C, CMake, Docker
---

Print `Hello, World!` using C.

Configure with CMake. Run with Docker.


## Background

Configuring and compiling a project can be complex, even for a simple code base.
This project illustrates two different approaches, each using CMake:

  * your [system's tools](system-tools.md)
  * a [Docker container](docker.md)


### Directory Structure

A high-level view of the project is:

```bash
.
├── build_c_hello_world/
├── c_hello_world/
├── Dockerfiles/
├── docker_run.sh
├── docs/
├── example.env
├── LICENSE
└── README.md
```

`c_hello_world` contains the source code.

`build_c_hello_world` is an out-of-tree build directory. Build commands are run
here and build output is generated here, leaving the source directory untouched.
This allows you to compile for different configurations (release, debug),
different architectures (x86, ARM, etc), or even with different compilers!
I've created one for your convenience, but you are typically expected to create your own.

`Dockerfiles/` contains a Dockerfile that can be used for compilation.
I've included it for your convenience, but typically you'll fetch this yourself.

`docker_run.sh` is a helper script for starting a Docker container. You don't
have to use it, but it will make things easier.

`example.env` demonstrates how to configure `docker_run.sh`. There are a few
environment variables to keep things flexible.

`docs/` contains the source code for these documentation pages. You can look at
it if you'd like, but you're already reading the result.


### Build Instructions

For detailed build instructions, see one of the following:

  * [system tools](system-tools.md)
  * [Docker](docker.md)
