#include <stdio.h>
#include <omp.h>

int main (int argc, char*argv[]) {
  int tid;                // 
  omp_set_num_threads(3); // set because all we need here are 3 threads
  #pragma omp parallel private(tid)
  {
    #pragma omp critical(a)
    {
      printf("[thread %d] hi A\n", omp_get_thread_num());
    }

    #pragma omp critical(b)
    {
      printf("[thread %d] hi B\n", omp_get_thread_num());
    }

    #pragma omp critical(c)
    {
      printf("[thread %d] hi C\n", omp_get_thread_num());
    }
  }
  return 0;
}
