---
layout: page
title: CMake/gcc
---

## Compiling with System Tools

If your system already has compatible versions of CMake and gcc installed,
the project can be configured and built easily.


Enter the out-of-tree build directory:
```
$ cd build_c_hello_world
```

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
