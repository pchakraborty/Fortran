#include<cstdio>

// Callback routine
extern "C"{
  void myCallbackFunction(int *n, float *y){
    printf("Integer input: %d\n", *n);
    printf("Float input: %f\n", *y);
    *y = *y + (float)(*n);
    printf("Float output: %f\n", *y);
  }
}

// Routine implemented in Fortran
extern "C"{
  void fortroutine(void (*)(int *, float *));
}

int main(void){
  fortroutine(&myCallbackFunction);
  return 0;
}
