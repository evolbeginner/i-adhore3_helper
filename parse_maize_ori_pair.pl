#! /bin/env perl

open(my $IN, '<', $ARGV[0]) || die "";
while(my $line = <$IN>){
    chomp($line);
    next if $line !~ /\w/;
    next if $line =~ /chr/;
    my ($gene_set1, $gene_set2) = split("\t", $line);
    foreach my $gene1 (split(/\|\|/, $gene_set1)){
        foreach my $gene2 (split(/\|\|/, $gene_set2)){
            print $gene1."\t".$gene2."\n";
        }
    }
}





