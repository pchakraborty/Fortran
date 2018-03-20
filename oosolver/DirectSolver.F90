#include "trcbak.h"

module DirectSolverMod

  use SolverBaseMod, only: SolverBase
  use SparseMatrixMod, only: spmat

  implicit none

  type, extends(SolverBase) :: DirectSolver
   contains
     procedure :: solve => direct_solve
  end type DirectSolver

contains

  pure subroutine direct_solve(this, A, b, x)

    ! Argument
    class(DirectSolver), intent(in) :: this
    type(spmat), intent(in) :: A
    real, contiguous, intent(in) :: b(:)
    real, contiguous, intent(out) :: x(:)

    x = -1.0

  end subroutine direct_solve

end module DirectSolverMod
