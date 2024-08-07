#  Strain Identity by WGS

Date: September 2021

# Strains sequenced at NCSU - round 1
*Gardnerella* VC04, VM224, VM35

Isolate DNA with Qiagen DNeasy Ultraclean microbial kit
Lyndy in Thakur lab sequenced
Check quality with FastQC v0.11.9
Assemble with Spades v3.15.3 (spades_assembly.sh)
Annotate with Prokka v1.14.6 (prokka_annotate.sh)
Re-organize Prokka outputs (organizeProkkaOutput.R)
Check identity with Mash v2.2 (gard_strains_genomes.Rmd)

# Strains sequenced at NCSU - round 2
Sequence strains that could not be confirmed by *cpn60* sequence
*Gardnerella* C0093B3, C0179E1, CMW7778B

readsIsolate DNA with Qiagen DNeasy Ultraclean microbial kit
Lyndy in Thakur lab sequenced
Check quality with FastQC v0.11.9
Assemble with Spades v. 3.15.3 (spades_assembly.sh)
Annotate with Prokka v. 1.14.6 (prokka_annotate.sh)
Check identity with Mash v. 2.2 (gard_strains_genomes.Rmd)
Check identity of failed isolates with blastn v2.10.1+ against nt

 
# Strains sequenced at VCU
*Gardnerella* EX88479VC03, EX88479VC04
*Lactobacillus crispatus* EX533959VC03, EX849587VC01 
Note: EX88479VC04 analyzed above, not using this assembly

*Gardnerella* EX88479VC03 assembly analyzed as follows:
Annotate with Prokka v. 1.14.6 (prokka_annotate.sh)
Check identity with Mash v. 2.2
Check identity with Mash v. 2.2 (vcu_gard_genomes.Rmd)

# Strains sequenced from Jaques Ravel
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

# ATCC 14018
*Gardnerella vaginalis 14018*
Most recent phylogeny made September 2020 was dereplicated, has ATCC 14019 instead of ATCC 14018 (genomes suggest they are identical strains)
Download complete genome of ATCC 14019 on 10/19/2021:
NZ_AP012332.1 from RefSeq. Assembly ID ASM104265v1, Organism name Gardnerella vaginalis ATCC 14018 = HCM 11026
Place this genome in the `./ATCC 14018 Genome` directory
Annotate with Prokka v. 1.14.6 (prokka_annotate.sh)


# Assess all genomes and add to phylogeny
1) Run Mash in `gard_strain_phylogenetics.Rmd`
2) Run roary to determine core genome with blastp thresholds of 60% and 95% using `/scripts/roaryCoreGenome.sh`
`docker container ls -a` to determine container names with output directories
`docker cp 05f82792ed61:/20221026_Roary_60 '/Volumes/GoogleDrive-103667279570938865306/My Drive/Callahan Lab/gardnerella_experiments/strain_genomes'`  and 
`docker cp 2c3602cdf52e:/20221026_Roary_95 '/Volumes/GoogleDrive-103667279570938865306/My Drive/Callahan Lab/gardnerella_experiments/strain_genomes'` to copy output directories to repository
Also run roary on 80% blastp results based on output from 60% threshold results. copy output with:
`docker cp 39935359e4ca:/20221031_Roary_80 '/Volumes/GoogleDrive-103667279570938865306/My Drive/Callahan Lab/gardnerella_experiments/strain_genomes'`
3) Build phylogeny for 95% and 80% alignments using `/scripts/MLPhylogeny.sh


