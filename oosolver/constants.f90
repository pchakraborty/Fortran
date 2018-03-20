module ConstantsMod

  use iso_fortran_env, only: r4=>real32, r8=>real64, i4=>int32

  implicit none

  integer, parameter :: MAXSTRLEN = 256
  integer, parameter :: SUCCESS = 0
  integer, parameter :: FAILURE = -1

end module ConstantsMod
