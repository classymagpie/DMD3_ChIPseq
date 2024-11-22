#!/bin/bash

#BATCH --verbose
#SBATCH --job-name=rvm_dups_1
#SBATCH --time=15:00:00
#SBATCH --nodes=1
#SBATCH --mem=20GB
#SBATCH --mail-type=ALL


#Time
start=$(date +"%T")
echo "begin remove duplicates: $start"

module purge
module load bedtools/intel/2.27.1
module load samtools/intel/1.6
module load macs2/intel/2.1.1

#Remove all duplicates that appear more then expected. Can modify duplicate number easily by
#adding in the --keep-dup parameter to another number i.e. --keep-dup=5
#run this command in the BAM folder

macs2 filterdup -f BAM -i /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/chip_sample_2_clean.bam -o /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_2_clean_dupsrm.bed
macs2 filterdup -f BAM -i /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/chip_input_2_clean.bam -o /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_2_clean_dupsrm.bed
macs2 filterdup -f BAM -i /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/chip_sample_3_clean.bam -o /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_3_clean_dupsrm.bed
macs2 filterdup -f BAM -i /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/chip_input_3_clean.bam -o /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_3_clean_dupsrm.bed
macs2 filterdup -f BAM -i /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/chip_sample_4_clean.bam -o /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_4_clean_dupsrm.bed
macs2 filterdup -f BAM -i /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/chip_input_4_clean.bam -o /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_4_clean_dupsrm.bed

echo "filterdup done" 
