#! /bin/env perl

use strict;
use 5.010;
use Getopt::Long;


###################################################################
my $gff3_file;


###################################################################
Getoptions(
    'gff3|gff=s'  =>  \$gff3_file;
) || die "illegal params!";


###################################################################




