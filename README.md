# Systematic Assessment of Pathogenic Phenotypes of Gardnerella spp.
Compare phenotypes related to pathogenicity in 22 phenotypically diverse strains of *Gardnerella*. We first verified the phylogenetic identity of the isolate strains and then the following phenotypes were tested:
  
* Growth rate and carrying capactiy
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
* `strainIDs.csv`: Strain names, species names, and genbank accessions of strains with a genome deposited in GenBank
* `gard_strain_phylogenetics.Rmd`: R code for phylogenetic comparison of strains.
  
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

## knit_markdowns
Knit html markdowns for all R code
