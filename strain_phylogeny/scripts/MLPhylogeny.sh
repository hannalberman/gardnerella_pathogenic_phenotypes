#!/bin/bash
#SBATCH -o /home6/hlberman/gard_isolates/strain_phylogeny/log/raxml_%j.out
#SBATCH -c 16

# Maximum likelihood core genome phylogeny of 99 Gardnerella whole genome assemblies with  RAxML v8.2.12
# RAxML
# A. Stamatakis: "RAxML Version 8: A tool for Phylogenetic Analysis and Post-Analysis of Large Phylogenies". In Bioinformatics, 2014

inaln='/gardnerella_pathogenic_phenotypes/strain_phylogeny/core_genome_alignments/core_gene_alignment.aln'     #/home6/hlberman/gard_isolates/strain_phylogeny/core_gene_alignment.aln
outdir='/gardnerella_pathogenic_phenotypes/strain_phylogeny/ml_phylogeny_output'   #/home6/hlberman/gard_isolates/strain_phylogeny/20221101_ml_phylogeny

# compute maximum liklihood phylogeny
# -p = parsimony random number seed
# GTRGAMMA = General time reversible model plus gamma
/home6/hlberman/Applications/standard-RAxML-master/raxmlHPC-PTHREADS-SSE3 \
    -w $outdir -T 16 -p 732790 -m GTRGAMMA -s $inaln -n gardTree

# bootstrap with auto FC algorithm to determine number of bootstrap replicates
# cite: Pattengale et al., 2009 "How Many Bootstrap Replicates are Necessary?"
# -b = bootstrap random number seed
# autoFC = frequency-based criterion, automatically determine number of runs 
/home6/hlberman/Applications/standard-RAxML-master/raxmlHPC-PTHREADS-SSE3 \
    -w $outdir -T 16 -p 732790 -m GTRGAMMA -s $inaln -n FCBootstrap -b 732790 -N autoFC