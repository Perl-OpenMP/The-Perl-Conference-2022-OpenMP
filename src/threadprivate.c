#include <stdio.h>
#include <omp.h>

int counter = 0;
#pragma omp threadprivate(counter)

void inc_count() {
  counter++;
}

int main() {
  int tid;
  #pragma omp parallel private(tid)
  {
    // one thread will generate tasks
    #pragma omp single
    {
      // task body, will get picked up by available
      // worker threads
      int i;
      for (i = 1; i<=10; i++) {
        #pragma omp task
        {
          int j;
          tid = omp_get_thread_num();
          for (j = 1; j<=tid; j++) {
            inc_count();
          }
          printf("Counter %d is now: %d\n",tid,counter);
        }
      }
    }
  }
  return 0;
}
