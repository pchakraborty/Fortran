#define MAIN__
#include "trcbak.h"

program main

  use ConstantsMod, only: SUCCESS
  use SolverBaseMod, only: SolverBase
  use SparseMatrixMod, only: spmat
  use SolverFactoryMod, only: SolverFactory
  
  implicit none

  integer, parameter :: N = 25
  
  class(SolverBase), allocatable :: mySolver
  real :: b(N), x(N)
  type(spmat) :: A
  integer :: mystatus

  ! Sparse matrix
  A = spmat(N, mystatus)
  VERIFY_(mystatus==SUCCESS)
  VERIFY_(A%IsValid())

  ! Create direct solver and call it
  call SolverFactory(mySolver, "direct", mystatus)
  VERIFY_(mystatus==SUCCESS)
  call mySolver%solve(A, b, x)
  print *, "DirectSolver::x(1): ", x(1)
  deallocate(mySolver)

  ! Create iterative solver and call it
  call SolverFactory(mySolver, "iterative", mystatus)
  VERIFY_(mystatus==SUCCESS)
  call mySolver%solve(A, b, x)
  print *, "IterativeSolver::x(1): ", x(1)
  deallocate(mySolver)

  ! Create junk solver and call it
  call SolverFactory(mySolver, "junk", mystatus)
  VERIFY_(mystatus==SUCCESS)
  call mySolver%solve(A, b, x)
  deallocate(mySolver)

end program main
