#ifndef TRCBAK_

#define TRCBAK_

#ifdef MAIN__

#define VERIFY_(s) if(.not. s) then; print *, 'VERIFY: ', __FILE__, __LINE__; error stop; endif

#else

#define VERIFY_(s) if(.not. s) then; print *, 'VERIFY: ', __FILE__, __LINE__; return; endif

#endif

#endif
