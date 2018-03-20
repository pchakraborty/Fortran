#include "trcbak.h"

module SolverFactoryMod

  use ConstantsMod, only: MAXSTRLEN, SUCCESS, FAILURE
  use SolverBaseMod, only: SolverBase
  use DirectSolverMod, only: DirectSolver
  use IterativeSolverMod, only: IterativeSolver

  public :: SolverFactory

  private

contains

  subroutine SolverFactory(solver, solver_type, rc)

    ! Arguments
    class(SolverBase), allocatable, intent(out) :: solver
    character(len=*), intent(in) :: solver_type
    integer, intent(out) :: rc

    ! Locals
    integer :: mystatus

    ! Start
    rc = FAILURE

    if (trim(solver_type)=="direct") then
       allocate(DirectSolver::solver, stat=mystatus)
       VERIFY_(mystatus==SUCCESS)
    elseif (trim(solver_type)=="iterative") then
       allocate(IterativeSolver::solver, stat=mystatus)
       VERIFY_(mystatus==SUCCESS)
    else
       VERIFY_(.false.)
    end if

    ! All good
    rc = SUCCESS

  end subroutine SolverFactory
  
end module SolverFactoryMod
