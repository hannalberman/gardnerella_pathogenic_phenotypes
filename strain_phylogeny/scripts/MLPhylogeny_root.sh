#!/bin/bash
#SBATCH -o /home6/hlberman/gard_isolates/strain_phylogeny/log/raxml_root_%j.out
#SBATCH -c 16

# Outgroup rooting maximum likelihood core genome phylogeny of 99 Gardnerella whole genome assemblies with  RAxML v8.2.12 with Bifidobacterium longum 51A (GCA_004936435.1) as outgroup
# RAxML
# A. Stamatakis: "RAxML Version 8: A tool for Phylogenetic Analysis and Post-Analysis of Large Phylogenies". In Bioinformatics, 2014

inaln= '/gardnerella_pathogenic_phenotypes/strain_phylogeny/core_genome_alignments/outgroup_core_gene_alignment.aln'   #/home6/hlberman/gard_isolates/strain_phylogeny/core_gene_alignment.aln
intreedir='/gardnerella_pathogenic_phenotypes/strain_phylogeny/ml_phylogeny_output/RAxML_bestTree.gardTree' #/home6/hlberman/gard_isolates/strain_phylogeny/20221101_ml_phylogeny
outdir='/gardnerella_pathogenic_phenotypes/strain_phylogeny/epa_output'  #/home6/hlberman/gard_isolates/strain_phylogeny/20260210_ml_phylogeny_rooted

# Use EPA algorithm to root phylogeny with B. longum 51A on best tree
raxmlHPC-PTHREADS-SSE3 -w $outdir -f v --epa-keep-placements=100 -t $intreedir/RAxML_bestTree.gardTree -m GTRGAMMA -s $inaln -n rootedGardTree