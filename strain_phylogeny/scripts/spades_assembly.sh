#!/bin/bash


#set file paths
in_path=/Users/hlberman/Desktop/reads
out_path=/Users/hlberman/Desktop/assemblies
 
run assemblies
spades.py \
    -1 $in_path/VC04_S25_L001_R1_001.fastq.gz \
    -2 $in_path/VC04_S25_L001_R2_001.fastq.gz \
    --isolate \
    -o $out_path/VC04

spades.py \
    -1 $in_path/UM224_S26_L001_R1_001.fastq.gz \
    -2 $in_path/UM224_S26_L001_R2_001.fastq.gz \
    --isolate \
    -o $out_path/UM224

spades.py \
    -1 $in_path/UM35_S27_L001_R1_001.fastq.gz \
    -2 $in_path/UM35_S27_L001_R2_001.fastq.gz \
    --isolate \
    -o $out_path/UM35

spades.py \
    -1 $in_path/C0093B3_S24_L001_R1_001.fastq.gz \
    -2 $in_path/C0093B3_S24_L001_R2_001.fastq.gz \
    --isolate \
    -o $out_path/C0093B3

spades.py \
    -1 $in_path/C0179E1_S22_L001_R1_001.fastq.gz \
    -2 $in_path/C0179E1_S22_L001_R2_001.fastq.gz \
    --isolate \
    -o $out_path/C0179E1

spades.py \
    -1 $in_path/CMW7778B_S23_L001_R1_001.fastq.gz \
    -2 $in_path/CMW7778B_S23_L001_R2_001.fastq.gz \
    --isolate \
    -o $out_path/CMW7778B