#include <stdio.h>
#include <omp.h>

int main (int argc, char*argv[]) {
  omp_set_num_threads(3); // set because all we need here are 3 threads
  #pragma omp parallel sections
  {
    #pragma omp section
    {
      printf("hi A\n");
    }

    #pragma omp section
    {
      printf("hi B\n");
    }

    #pragma omp section
    {
      printf("hi C\n");
    }
  }
  return 0;
}
