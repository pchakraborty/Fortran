program main

  use ParentMod, only: ParentType
  use ChildMod, only: ChildType
  
  class(ParentType), allocatable :: p
  
  allocate(ChildType::p)

  call p%initialize()
  
end program main
