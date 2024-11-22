#!/bin/bash

#BATCH --verbose
#SBATCH --job-name=rvm_dups_1
#SBATCH --time=15:00:00
#SBATCH --nodes=1
#SBATCH --mem=20GB
#SBATCH --mail-type=ALL


#Time
start=$(date +"%T")
echo "begin sort: $start"

module purge
module load bedtools/intel/2.27.1
module load samtools/intel/1.6
module load macs2/intel/2.1.1



#next i will use samtools sort 
#printf "Sorting $bamfile\n"

samtools sort -o /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_2_clean_dupsrm_sorted.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_2_clean_dupsrm.bam
samtools sort -o /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_2_clean_dupsrm_sorted.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_2_clean_dupsrm.bam
samtools sort -o /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_3_clean_dupsrm_sorted.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_3_clean_dupsrm.bam
samtools sort -o /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_3_clean_dupsrm_sorted.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_3_clean_dupsrm.bam
samtools sort -o /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_4_clean_dupsrm_sorted.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_4_clean_dupsrm.bam
samtools sort -o /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_4_clean_dupsrm_sorted.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_4_clean_dupsrm.bam

echo "done sorting bam"
echo "begin copying sorted bams"

cp /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_2_clean_dupsrm_sorted.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_2_clean_dupsrm_sort.bam
cp /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_2_clean_dupsrm_sorted.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_2_clean_dupsrm_sort.bam
cp /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_3_clean_dupsrm_sorted.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_3_clean_dupsrm_sort.bam
cp /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_3_clean_dupsrm_sorted.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_3_clean_dupsrm_sort.bam
cp /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_4_clean_dupsrm_sorted.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_4_clean_dupsrm_sort.bam
cp /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_4_clean_dupsrm_sorted.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_4_clean_dupsrm_sort.bam

echo "done copying sorted bams new name is sort"
echo "using mv to replace the sorted files, new name indexed"

mv /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_2_clean_dupsrm_sorted.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_2_clean_dupsrm_sorted_indexed.bam
mv /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_2_clean_dupsrm_sorted.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_2_clean_dupsrm_sorted_indexed.bam
mv /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_3_clean_dupsrm_sorted.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_3_clean_dupsrm_sorted_indexed.bam
mv /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_3_clean_dupsrm_sorted.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_3_clean_dupsrm_sorted_indexed.bam
mv /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_4_clean_dupsrm_sorted.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_4_clean_dupsrm_sorted_indexed.bam
mv /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_4_clean_dupsrm_sorted.bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_4_clean_dupsrm_sorted_indexed.bam

echo "starting actual indexing of index files"
#next i will index the bams

samtools index /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_2_clean_dupsrm_sorted_indexed.bam
samtools index /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_2_clean_dupsrm_sorted_indexed.bam
samtools index /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_3_clean_dupsrm_sorted_indexed.bam
samtools index /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_3_clean_dupsrm_sorted_indexed.bam
samtools index /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_4_clean_dupsrm_sorted_indexed.bam
samtools index /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_4_clean_dupsrm_sorted_indexed.bam

echo "indexing of index files completed successfully"
