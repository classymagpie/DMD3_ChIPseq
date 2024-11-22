#!/bin/bash

#BATCH --verbose
#SBATCH --job-name=bowtie_raw
#SBATCH --time=5:00:00
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=40GB
#SBATCH --mail-type=ALL

module purge

module load bowtie2/intel/2.3.2
module load perl/intel/5.24.0

cp /genomics/genomes/Public/Invertebrate/Caenorhabditis_elegans/Ensembl/WBcel235/Caenorhabditis_elegans.WBcel235.dna.toplevel* .

np=$SLURM_CPUS_PER_TASK

bowtie2 -p $np -x /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/Caenorhabditis_elegans.WBcel235.dna.toplevel -U /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/chip_sample_2_clean.fastq -S /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/chip_sample_2_clean.sam 
bowtie2 -p $np -x /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/Caenorhabditis_elegans.WBcel235.dna.toplevel -U /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/chip_sample_3_clean.fastq -S /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/chip_sample_3_clean.sam 
bowtie2 -p $np -x /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/Caenorhabditis_elegans.WBcel235.dna.toplevel -U /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/chip_sample_4_clean.fastq -S /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/chip_sample_4_clean.sam 
bowtie2 -p $np -x /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/Caenorhabditis_elegans.WBcel235.dna.toplevel -U /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/chip_input_2_clean.fastq -S /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/chip_input_2_clean.sam 
bowtie2 -p $np -x /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/Caenorhabditis_elegans.WBcel235.dna.toplevel -U /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/chip_input_3_clean.fastq -S /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/chip_input_3_clean.sam 
bowtie2 -p $np -x /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/Caenorhabditis_elegans.WBcel235.dna.toplevel -U /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/chip_input_4_clean.fastq -S /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/chip_input_4_clean.sam 

module load samtools/intel/1.9
samtools view -bS chip_input_2_clean.sam > chip_input_2_clean.bam
samtools view -bS chip_input_3_clean.sam > chip_input_3_clean.bam
samtools view -bS chip_input_4_clean.sam > chip_input_4_clean.bam
samtools view -bS chip_sample_2_clean.sam > chip_sample_2_clean.bam
samtools view -bS chip_sample_3_clean.sam > chip_sample_3_clean.bam
samtools view -bS chip_sample_4_clean.sam > chip_sample_4_clean.bam
