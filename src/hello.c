#include <stdio.h>
#include <omp.h>

int main (int argc, char*argv[]) {
  int tid;
  #pragma omp parallel private(tid)
  {
    tid = omp_get_thread_num();
    printf("hi, from thread %d\n", tid);
    #pragma omp master
      printf("%d threads say hi!\n", omp_get_num_threads()); 
    #pragma omp barrier
  }

  return 0;
}
