#  Gardnerella Strain Phylogeny

## New strain genome sources and assembly methods 
Strains with genomes not in Berman et al. (2024) *mSystems* phylogeny

### Strains sequenced at NCSU
*Gardnerella* UM224, UM35

Isolate DNA with Qiagen DNeasy Ultraclean microbial kit ()
Sequenced on Illumina MiSeq
Check quality with FastQC v0.11.9
Assemble with Spades v3.15.3 (spades_assembly.sh)

### Strains sequenced from Jaques Ravel Lab
*Gardnerella vaginalis* C0011E4
*Gardnerella*  sp. 2 C0084H9
*Gardnerella* sp. 3 C0040C2
*Gardnerella piotii* C0093B3
*Gardnerella leopoldii* C0096A1
*Gardnerella swidsinkii* C0102A1
*Gardnerella* sp. 7 C0179B3
*Gardnerella* sp. 8 C0056B5
*Gardnerella* sp. 10 C0100B2
*Gardnerella* sp. 11 C0101A1
*Gardnerella* sp. 13 C0179E1

Genomes provided by Michael France on September 15th 2021
Annotate with Prokka v. 1.14.6 (prokka_annotate.sh)

### NCBI Assemblies
*Gardnerella vaginalis* 14018 NZ_AP012332.1
*Gardnerella pickettii* JCP8017B from GenBank

## Assess all genomes and add to phylogeny
1) Annotate with Prokka v. 1.14.6 (prokka_annotate.sh) and re-organize Prokka outputs (organizeProkkaOutput.R)
2) Compare new genomes to Berman et al., 2024 genomes using Mash in `gard_strain_phylogeny.Rmd`
3) Run roary to determine core genome with blastp thresholds of 60% and 95% using `./scripts/roaryCoreGenome.sh`
Also run roary on 80% blastp results based on output from 60% threshold results. copy output with:
`docker cp 39935359e4ca:/20221031_Roary_80 '/Volumes/GoogleDrive-103667279570938865306/My Drive/Callahan Lab/gardnerella_experiments/strain_genomes'`
4) Build phylogeny for 80% alignments and perform bootstrap analyses for support using RAxML version 8 with `./scripts/MLPhylogeny.sh`. Resulting alignmnet can be found in `./core_genome_alignments/core_gene_alignment.aln`
5) Root `./ml_phylogeny_output/RAxML_bestTree.gardTree` phylogeny with *Bifidobacterium longum* 51A (GCA_004936435.1) as outgroup
* Input alignment can be found in `./core_genome_alignments/outgroup_core_gene_alignment.aln`
* Run roary for outgroup `./scripts/roaryCoreGenome.sh` but with *B. longum* genome added to input
* Place outgroup onto phylogeny with EPA algorithm in RAxML version 8 with `./scripts/MLPhylogeny_root.sh`
*  `rootedGardPhylogeny_noOutgroup.tre` has been rooted at the outgroup node and outgroup tip deleted using iToL. This phylogeny was used as input for phenotype phylogenetic signal testing.
6) The phylogeny was re-rooted at the outgroup with ape v5.8-1 and the outgroup tip removed. The bootstrap confidence values were added to the phylogeny with Phangorn v2.12.1, and the tree was visualized with ggtree v4.0.4 in `gard_strain_phylogeny.Rmd`

