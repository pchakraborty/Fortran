module ParentMod
  
  private
  public :: ParentType
  
  type, abstract :: ParentType ! An ABSTRACT derived type
     real, allocatable :: rdata(:,:)
   contains
     procedure(init_interface), deferred :: initialize
  end type ParentType
  
  abstract interface
     subroutine init_interface(this)
       import ParentType
       class(ParentType) :: this
     end subroutine init_interface
  end interface
  
end module ParentMod
