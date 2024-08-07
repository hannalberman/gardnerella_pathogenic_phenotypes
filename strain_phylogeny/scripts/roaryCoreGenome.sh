#!/bin/bash

# Determine core genome of Gardnerella genome assemblies. Reference genomes and genomes of lab strains


# copied to desktop due to path name incompatability with Google Drive. 
# Include GFFs from: 
# Reference: 
# /Volumes/GoogleDrive/My Drive/Callahan Lab/metagenome_gardnerella/gardPhylogeny/prokka_annotated_genomes/gff
# Strain Genomes:
# /Volumes/GoogleDrive/My Drive/Callahan Lab/gardnerella_experiments/strain_genomes/prokka_annotated_genomes/gff
indir=/Users/hlberman/Desktop/gff 
#outdir60=20221026_Roary_60
#outdir95=20221026_Roary_95
outdir80=20221031_Roary_80

#pull roary docker image if not already with below command
#docker pull sangerpathogens/roary

#Run with a blastp threshold of 60% to observe range of blastp hits from 60 to 100
#docker run --volume $indir:$indir \
#   sangerpathogens/roary roary -e --mafft -n -v -i 60 -r -o clusters -f \
#   $outdir60 $indir/*.gff

#Run with blastp threshold of 95% to determine core genome to rebuild phylogeny 
#docker run --volume $indir:$indir \
#   sangerpathogens/roary roary -e --mafft -n -v -i 95 -r -o clusters -f \
#   $outdir95 $indir/*.gff

#Run with blastp threshold of 80% to determine core genome to rebuild phylogeny
docker run --volume $indir:$indir \
   sangerpathogens/roary roary -e --mafft -n -v -i 80 -r -o clusters -f \
   $outdir80 $indir/*.gff

#Run with blastp threshold of 95% with B longum 51A genome for outgroup rooting.

# indirOutgroup=/Users/hlberman/Desktop/outgroup_gff
# outdirOutgroup=<>_Roary_outgroup

# docker run --volume $indirOutgroup:$indirOutgroup \
#     sangerpathogens/roary roary -e --mafft -n -v -i 95 -r -o clusters -f \
#     $outdirOutgroup $indirOutgroup/*.gff
