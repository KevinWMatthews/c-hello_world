# c-hello_world

Print `Hello, World!` using C. Compile with you system's CMake/gcc or using a Docker container.


## Background

Setting up a compilation environment can be complex, even for a simple code base. This project demonstrates one approach to a scalable build system.

It can be compiled with CMake and gcc using two different environments:

  * System CMake/gcc
  * Docker


## Project Structure

  * `hello_world/` subdirectory contains the source code.
  * `build_hello_world/` will hold build artifacts.
  * `Dockerfiles/` contains files for Docker.
  * `docker_run.sh` is a wrapper around the `docker run` command.
  * `docs/` contains the source for the documentation pages


## Build Instructions

For detailed build instructions, see the [documentation pages](https://kevinwmatthews.github.io/c-hello_world/).
