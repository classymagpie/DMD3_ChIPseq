#!/bin/sh
#
#SBATCH --verbose
#SBATCH --job-name=bamtobedformacs
#SBATCH --time=30:00
#SBATCH --nodes=1
#SBATCH --mem=30GB

module purge
module load samtools/intel/1.6
module load bedtools/intel/2.27.1


# convert bam to bed for MACS peak calling (bedtools/intel/2.27.1)

# use command "bedtools bamtobed -i $bamfile > ${bamfile}.bed

echo "from bam to bed initiated"

bedtools bamtobed -i /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_2_clean_dupsrm_sorted_indexed.bam > /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_2_clean_dupsrm_sorted_indexed_forMACS.bed
bedtools bamtobed -i /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_2_clean_dupsrm_sorted_indexed.bam > /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_2_clean_dupsrm_sorted_indexed_forMACS.bed
bedtools bamtobed -i /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_3_clean_dupsrm_sorted_indexed.bam > /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_3_clean_dupsrm_sorted_indexed_forMACS.bed
bedtools bamtobed -i /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_3_clean_dupsrm_sorted_indexed.bam >  /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_3_clean_dupsrm_sorted_indexed_forMACS.bed
bedtools bamtobed -i /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_4_clean_dupsrm_sorted_indexed.bam > /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_4_clean_dupsrm_sorted_indexed_forMACS.bed
bedtools bamtobed -i /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_4_clean_dupsrm_sorted_indexed.bam > /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_4_clean_dupsrm_sorted_indexed_forMACS.bed

echo "from bam to bed completed"
