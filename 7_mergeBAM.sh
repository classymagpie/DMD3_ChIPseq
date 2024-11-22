#!/bin/sh
#
#SBATCH --verbose
#SBATCH --job-name=mergeBam
#SBATCH --time=30:00
#SBATCH --nodes=1
#SBATCH --mem=30GB

##
## Merges a list of bam files using samtools merge.
##




#merge the bams of replicates (samtools/intel/1.6):
# use command samtools merge chip_merged.bam chip1.bam chip2.bam
# use command samtools merge input_merged.bam input1.bam input2.bam

module purge
module load samtools/intel/1.6
module load bedtools/intel/2.27.1

echo "merge initiated"

samtools merge /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/mergedBAM/chip_merged.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_2_clean_dupsrm_sorted_indexed.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_3_clean_dupsrm_sorted_indexed.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_4_clean_dupsrm_sorted_indexed.bam
samtools merge /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/mergedBAM/input_merged.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_2_clean_dupsrm_sorted_indexed.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_3_clean_dupsrm_sorted_indexed.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_4_clean_dupsrm_sorted_indexed.bam

echo "merge completed"
