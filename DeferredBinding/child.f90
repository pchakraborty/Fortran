module ChildMod

  use ParentMod, only: ParentType 
  private
  public :: ChildType

  type, extends(ParentType) :: ChildType
   contains
     procedure :: initialize
  end type ChildType

contains
  
  subroutine initialize(this)
    class(ChildType) :: this
    print *, "ChildType:initialize"
    allocate(this%rdata(10,20), source=1.0e15)
  end subroutine initialize

end module ChildMod
