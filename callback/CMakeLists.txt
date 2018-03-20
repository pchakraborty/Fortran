cmake_minimum_required(VERSION 2.8)

project(callback CXX Fortran)

# Sources
set(callback_src main.cpp fortroutine.f90)
message(STATUS "Source: ${callback_src}")

# Build executable
add_executable(callback ${callback_src})
