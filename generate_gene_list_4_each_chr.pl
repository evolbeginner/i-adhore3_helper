#! /bin/env perl

use strict;
use 5.010;
use Getopt::Long;


###################################################################
my (@types, %typesh);
my ($gff3_file);


###################################################################
Getoptions(
    'gff3|gff=s'  =>  \$gff3_file,
    'type=s'  =>  \@types,
) || die "illegal params!";

@typesh{@types} = "" x scalar(@types);


###################################################################
open(my $IN, "<", $gff3_file) || die;
while(my $line = <$IN>){
    chomp($line);
}





