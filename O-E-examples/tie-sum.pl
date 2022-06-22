#!/usr/bin/perl

use strict;
use warnings;
use FindBin qw/$Bin/;
use lib qq{$Bin/lib};

use Tie::Array::OmpSum;
use OpenMP::Environment qw//;

my @giant_list = (1 .. 100_000_000);
tie my $array_sum, 'Tie::Array::OmpSum', \@giant_list;

my $oe = OpenMP::Environment->new;
foreach my $num_threads (qw/1 2 4 8 16 20/) {
  $oe->omp_num_threads($num_threads);
  printf qq{%02d threads -> sum = $array_sum ...\n}, $num_threads;
}
