#!/usr/bin/env perl

use strict;
use warnings;

use OpenMP::Environment ();

my $env = OpenMP::Environment->new;
 
foreach my $np (qw/1 2 4 8 16 20 24 32/) {
  print qq{Running ./bin/omp-pi-2.x using $np threads...\n};
  $env->omp_num_threads($np);
  system(qw{./bin/omp-pi-2.x});
}

