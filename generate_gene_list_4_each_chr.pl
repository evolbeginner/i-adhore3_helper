#! /bin/env perl

use strict;
use 5.010;
use Getopt::Long;


###################################################################
my (@types, %typesh);
my ($gff3_file, $outdir, $is_force);

my %gene_info_on_chr;


###################################################################
GetOptions(
    'gff3|gff=s'  =>  \$gff3_file,
    'type=s'  =>  \@types,
    'outdir=s'  =>  \$outdir,
    'force!'    =>  \$is_force,
) || die "illegal params!";

@typesh{@types} = "" x scalar(@types);
die "Outdir has to be given! Exiting ......" if not $outdir;


if ($is_force){
    if ( -e $outdir ){
        `rm -rf $outdir`;
    }
}
`mkdir -p $outdir`;


###################################################################
open(my $IN, "<", $gff3_file) || die;
while(my $line = <$IN>){
    chomp($line);
    #9	ensembl	gene	66347	68582	.	-	.	ID=GRMZM2G354611;Name=GRMZM2G354611;biotype=protein_coding
    my ($chr, $type, $strand, $attributes) = (split(/\t/, $line))[0,2,6,8];
    next if not exists $typesh{$type};
    my ($gene_name) = $attributes =~ /(?<=ID=)([^;]+)/;
    push @{$gene_info_on_chr{$chr}}, $gene_name;
}


foreach my $chr (sort keys %gene_info_on_chr){
    #print $chr."\n";
    open(my $OUT, '>', "$outdir/$chr") || die;
    map {print $OUT $_."+\n"} @{$gene_info_on_chr{$chr}};
    close $OUT;
}


