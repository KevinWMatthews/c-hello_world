cmake_minimum_required(VERSION 3.5.1 FATAL_ERROR)

project(HelloWorld VERSION 1.0.0)
enable_language(C)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")

add_executable(hello_world
    main.c
)
