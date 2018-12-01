---
layout: page
title: CMake/gcc
---


Use your system's CMake and gcc to compile, build, and run.


## Background

If your system already has compatible versions of CMake and gcc installed,
the project can be configured and built easily.


## Prerequisites

  * gcc
  * CMake 3.5


## Setup

All commands should be run from the out-of-tree build directory:

```
$ cd build_c_hello_world
```


## Compile Source

Configure the build system:
```
$ cmake ../c_hello_world
```
This generates the build system in your build directory
from the `CMakeLists.txt` file in the specified source directory,
`c_hello_world`.

Compile:
```
$ make
```

Run the resulting executable using:
```
$ ./build_c_hello_world/bin/hello_world
Hello, World!
```
