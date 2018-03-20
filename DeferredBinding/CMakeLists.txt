cmake_minimum_required(VERSION 2.8)

project(defbind Fortran)

# Sources
set(defbind_src parent.f90 child.f90 main.f90)
message(STATUS "Source: ${defbind_src}")

# Build executable
add_executable(defbind ${defbind_src})
