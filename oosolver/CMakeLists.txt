project(solver Fortran)

cmake_minimum_required(VERSION 2.8)

file(GLOB srcFiles *.f90 *.F90)

add_executable(solver ${srcFiles})
