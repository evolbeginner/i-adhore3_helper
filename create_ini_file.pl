#! /bin/env perl

use strict;
use 5.010;
use Getopt::Long;
use File::Basename;


###################################################################
my ($outfile);
my ($genome_indir, $blast_table, $output_path, $param);


$param =
'
gap_size= 30
cluster_gap= 35
q_value=0.75
prob_cutoff=0.01
anchor_points=3
alignment_method=gg4
level_2_only=false
#table_type=family
multiple_hypothesis_correction=FDR
visualizeGHM=true
visGPairs=1 ath 2 ath
visualizeAlignment=true
';


###################################################################
sub process_genome_indir{
    my @output_items;
    my ($genome_indir) = @_;
=pod
    genome= ath
    1 ath_lists/1.lst
=cut
    #my $genome_indir_basename = dirname($genome_indir);
    push @output_items, "genome= $genome_indir";

    my $counter;
    foreach my $file (glob("$genome_indir/*")){
        $counter++;
        push @output_items, "$counter $file";
    }
    return(join("\n", @output_items));
}


sub process_blast_table{
    my ($blast_table) = @_;
    #blast_table= families.csv
    my $return_value = "blast_table= ". $blast_table;
    return($return_value);
}


sub process_output_path{
    my ($output_path) = @_;
    #output_path= arath_2_3_beta/
    my $return_value = "output_path= ". $output_path;
    return($return_value);
}


sub process_params{
    my ($param) = @_;
    return($param);
}


###################################################################
GetOptions(
    'genome_dir|genome_indir=s'  =>  \$genome_indir,
    'blast_table=s'              =>  \$blast_table,
    'output_path|outdir=s'       =>  \$output_path,
    'o|out|outfile|out_file=s'    =>  \$outfile,
) || die "illegal params!";

open(my $OUT, ">", $outfile) || die;


###################################################################
my $output = &process_genome_indir($genome_indir);
print $OUT $output."\n\n";

my $output = &process_blast_table($blast_table);
print $OUT $output."\n\n";

$output = &process_output_path($output_path);
print $OUT $output."\n";

$output = &process_params($param);
print $OUT $output."\n";



