module SolverBaseMod

  type, abstract :: SolverBase ! ABSTRACT derived type
   contains
     procedure(GenericSolverInterface), deferred :: solve
  end type SolverBase

  abstract interface
     pure subroutine GenericSolverInterface(this, A, b, x)
       use SparseMatrixMod, only: spmat
       import SolverBase
       class(SolverBase), intent(in) :: this
       type(spmat), intent(in) :: A
       real, contiguous, intent(in) :: b(:)
       real, contiguous, intent(out) :: x(:)
     end subroutine GenericSolverInterface
  end interface
  
end module SolverBaseMod
