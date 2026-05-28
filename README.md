# Systematic Assessment of Pathogenic Phenotypes of Gardnerella spp.
Compare phenotypes related to pathogenicity in 22 phenotypically diverse strains of *Gardnerella*. We first verified the phylogenetic identity of the isolate strains, and the following phenotypes were tested:
  
* Growth rate and carrying capacity
* Biofilm formation
* Growth at varying pH
* Metronidazole MIC

## strain_phylogeny
Verify the phylogenetic identity of the 22 *Garderella* isolate strains. 
* `scripts`: directory with scripts used for assembling newly sequenced genomes and reconstructing phylogeny of *Gardnerella* strains and reference sequences. This directory contains:  
   + `spades_assembly.sh`: Assemble strain genomes after sequencing
   + `prokka_annotate.sh`: Annotate genomes with [Prokka](https://github.com/tseemann/prokka)
   + `organize_prokka_output.sh`: Reorganize Prokka outputs by file type instead of strain
   + `roaryCoreGenome.sh`:  Define core genome of *Gardnerella* isolate strain genomes and reference genomes using [Roary](https://sanger-pathogens.github.io/Roary/) and perform multiple alignment.
   + `MLPhylogeny.sh`: Use [RAxML](https://github.com/stamatak/standard-RAxML) to reconstruct phylogeny.
   + `MLPhylogeny_root.sh`: Root phylogeny with *Bifidobacterium longum*
* `core_genome_alignments`: input alignments for `MLPhylogeny.sh` and `MLPhylogeny_root.sh`
* `ml_phylogeny_output`: output of `MLPhylogeny.sh`
* `epa_output`: output of `MLPhylogeny_root.sh`
* `strainIDs.csv`: Strain names, species names, and GenBank accessions of strains with a genome deposited in GenBank
* `2024mSystems_GardnerellaMetadata.csv`: metadata for strains used phylogeny from [Berman et al (2024) *mSystems*](https://journals.asm.org/doi/10.1128/msystems.01339-23)
* `2024mSystems_refGardnerellaCladesGenomos.csv`: clade and species identities of strains in phylogeny from [Berman et al (2024) *mSystems*](https://journals.asm.org/doi/10.1128/msystems.01339-23)
* `gard_strain_phylogeny.Rmd`: R code for phylogenetic comparison of strains and Figure 1 *Gardnerella* strain phylogeny
* `rootedGardPhylogeny_noOutgroup.tre`: Output tree used for measuring phylogenetic signal


## growth_curves
Measure the exponential growth rate and carrying capacity of each strain.
* `data`:
   + `gc_midlog_raw_data.csv`: Optical densities at each set up stage, including overnight incubations and mid log phase before seeding experiment
   + `gc_curve_raw_data.csv`: Optical densities during growth curve measurements
* `growth_curves.Rmd`: R code for analyzing growth curve data and calculating exponential growth rate and carrying capacity
  
## biofilm
Measure the biofilm production of each straing using percent OD of biofilm growth and safranin staining.
* `data`:
   + `biofilm_midlog_raw_data.csv`: Optical densities at each set up stage, including overnight incubations and mid log phase before seeding experiment
   + `biofilm_od_raw_data.csv`: Optical densities of biofilm growth
   + `planktonic_od_raw_data.csv`: Optical densities of planktonic growth
   + `safranin_biofilm_raw_data.csv`: Optical densities of safranin stained biofilm growth
   + `safranin_planktonic_raw_data.csv`: Optical densities of planktonic growth on safranin stained plate
* `biofilm_formation.Rmd`: R code for analyzing biofilm formation
  
## pH_growth
Measure growth of *Gardnerella* strains media with pH adjusted using lactic acid
* `data`:
  + `pH_midlog_raw_data.csv`: Optical densities at each set up stage, including overnight incubations and mid log phase before seeding experiment
  + `pH_raw_data.csv`: Optical densities for growth at varying pH 
* `pH_growth.Rmd`" R code for analyzing growth at varying pH

## metronidazole_mic
Measure minimum inhibitory concentrations of metronidazole for each strain
* `data`:
  + `strainIDs.csv`: Strain labels and species
  + `strainODs.csv`: Optical densities before seeding plates for MIC testing
  + `strainMICs.csv`: MICs recorded for each strain
* `metro_mics.Rmd`: R code for assessing MICs

## formatted_phenotype_data
Formatted phenotype data for growth rate, biofilm formation, and growth at varying pH. Each of these files contains the mean and standard deviations of phenotype measurement values for the technical replicates of each biological replicate of each strain.
* `growth_rate.csv`: exponential growth rate calculated in `./growth_curves/growth_curves.Rmd`
* `carrying_capacticy.csv`: carrying capacity calculated in `./growth_curves/growth_curves.Rmd`
* `percent_biofilm_od.csv`: percent of growth as biofilm calculated in `./biofilm/biofilm_formation.Rmd`
* `safranin_od.csv`: biofilm growth measured by optical density of safranin-stained biofilms calculated in `./biofilm/biofilm_formation.Rmd`
* `pH_growth.csv`: optical densities of strain growth at pH ranging from 3.5 to 7 calculated in `./pH_growth/pH_growth.Rmd`

## phenotype_phylogenetic_signal
Testing phylogenetic association of measured pathogenic _Gardnerella_ phenotypes
* `phylogenetic_signal_testing.Rmd`: R code to test phylogenetic signal in measured phenotypes

## knit_markdowns
Knit html markdowns for all R code
