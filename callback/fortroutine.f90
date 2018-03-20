module FortRoutineMod

  use iso_c_binding, only: c_int, c_float, c_funptr, c_f_procpointer
  
  implicit none

  private

  ! Interface of callback functions
  interface
     subroutine callback(n, y)
       import c_int, c_float
       implicit none
       integer(kind=c_int), intent(in) :: n
       real(kind=c_float), intent(inout) :: y
     end subroutine callback
  end interface

contains

  ! C-bound procedure
  subroutine fortroutine(cCallbackRoutine) bind(c)
    ! Arguments
    type(c_funptr), intent(in), value :: cCallbackRoutine
    
    ! Locals
    procedure(callback), pointer :: fCallbackRoutine
    integer :: n
    real :: x

    ! C-ptr to Fortran-ptr
    call c_f_procpointer(cCallbackRoutine, fCallbackRoutine)
    
    ! Call the passed-in function
    n = -24
    x = 65.1435
    call fCallbackRoutine(n, x)
    print *, 'Output of fCallbackRoutine: ', x
    
  end subroutine fortroutine

end module FortRoutineMod
