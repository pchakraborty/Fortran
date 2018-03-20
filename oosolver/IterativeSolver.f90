module IterativeSolverMod

  use SolverBaseMod, only: SolverBase
  use SparseMatrixMod, only: spmat

  implicit none

  type, extends(SolverBase) :: IterativeSolver
   contains
     procedure :: solve => iterative_solve
  end type IterativeSolver

contains

  pure subroutine iterative_solve(this, A, b, x)

    ! Argument
    class(IterativeSolver), intent(in) :: this
    type(spmat), intent(in) :: A
    real, contiguous, intent(in) :: b(:)
    real, contiguous, intent(out) :: x(:)
    
    x = -2.0

  end subroutine iterative_solve

end module IterativeSolverMod
