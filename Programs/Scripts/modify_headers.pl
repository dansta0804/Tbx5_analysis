#!/usr/bin/perl

# The script takes genome sequence file and modifies sequence headers
# by the following pattern: '>chr[chromosome]' where [chromosome]
# might be either a number from 1 - 19 range or a letter: X or Y.

use warnings;
use strict;

my $filename = $ARGV[0];
my $new_filename = "GCF_000001635.27_GRCm39_genomic_mod.fna";
open(old_genome, '<', $filename) or die $!;
open(new_genome, '>', $new_filename) or die $!;

while(<old_genome>) {
   if ($_ =~ /.*(chromosome ([1-9XY][0-9]?)).*/) {
       my $new_name = ">chr" . $2 . "\n";
       print(new_genome $new_name);
   }
   else {print(new_genome $_);}
}

close(new_genome);
close(old_genome);
