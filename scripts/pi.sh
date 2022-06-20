#!/bin/sh

unset OMP_NUM_THREADS

for np in 1 2 4 8 16 20 24 32
do
  export OMP_NUM_THREADS=$np
  ./bin/omp-pi-2.x
done
