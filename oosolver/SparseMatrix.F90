#include "trcbak.h"

module SparseMatrixMod

  use ConstantsMod, only: r8, SUCCESS, FAILURE

  ! Unlike in CSR or CSC formats, ar, ia, ja in COO format have
  ! same length. Its probably best for the COO format to be an
  ! array of 3-tuple (ia, ja, ar)
  ! type :: tuple(rk) ! rk = real kind
  !    integer, kind :: rk
  !    integer :: ia
  !    integer :: ja
  !    real(rk) :: ar
  ! end type tuple

  public :: spmat

  private

  ! Co-ordinate format
  type :: spmat
     integer, private :: N = -1
     integer, public, allocatable :: ia(:)
     integer, public, allocatable :: ja(:)
     real(r8), public, allocatable :: ar(:)
   contains
     procedure, public :: IsValid
     final :: cleanup
  end type spmat
  interface spmat
     module procedure initialize
  end interface spmat

contains

  function initialize(nnz, rc)

    ! Arguments
    integer, intent(in) :: nnz ! number of non-zeros
    integer, intent(out) :: rc
    type(spmat) :: initialize ! output

    ! Locals
    integer :: status

    ! Start
    rc = FAILURE

    initialize%N = nnz

    allocate(initialize%ia(nnz), stat=status)
    VERIFY_(status==SUCCESS)

    allocate(initialize%ja(nnz), stat=status)
    VERIFY_(status==SUCCESS)
 
    allocate(initialize%ar(nnz), stat=status)
    VERIFY_(status==SUCCESS)

    ! All good
    rc = SUCCESS

  end function initialize

  function IsValid(this) result(valid)

    ! Arguments
    class(spmat), intent(in) :: this
    logical :: valid ! output

    valid = .false.

    VERIFY_(allocated(this%ia))
    VERIFY_(allocated(this%ja))
    VERIFY_(allocated(this%ar))

    ! At this stage all arrays are allocated
    VERIFY_(size(this%ia)==size(this%ja))
    VERIFY_(size(this%ia)==size(this%ar))

    valid = .true.

  end function IsValid

  subroutine cleanup(this)

    ! Arguments
    type(spmat), intent(inout) :: this

    if (allocated(this%ia)) deallocate(this%ia)
    if (allocated(this%ja)) deallocate(this%ja)
    if (allocated(this%ar)) deallocate(this%ar)

    this%N = -1

  end subroutine cleanup

end module SparseMatrixMod
