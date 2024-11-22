#!/bin/bash
#
#BATCH --verbose
#SBATCH --job-name=bamCoverageNormalizaiton
#SBATCH --time=4:00:00
#SBATCH --nodes=1
#SBATCH --mem=60GB

##
## NOTE: This script is specific to the ChIP-seq pipeline
##

#Load in required tools
module purge
module load samtools/intel/1.6
module load deeptools/3.3.1
module load r/intel/3.4.2

#Time
start=$(date +"%T")
echo "Start normilization at: $start"



# Use Bamcompare to caluclate input subtracted and ratio of coverage data between input and ChIP datasets
# Outputs should be organized afterwords.
echo "first we will use subtraction opertation" 

bamCompare -b1 /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_2_clean_dupsrm_sorted_indexed.bam -b2 /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_2_clean_dupsrm_sorted_indexed.bam -o sample2_inputsubt.bw \
--operation subtract \
--binSize 10 \
--extendReads 400 \
--outFileFormat bigwig \
--minMappingQuality 20 \
--ignoreDuplicates \
--scaleFactorsMethod None \
--normalizeUsing CPM \
--exactScaling \
-bl /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/blacklist/ce10-blacklist.bed \
--ignoreForNormalization chrM

bamCompare -b1 /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_3_clean_dupsrm_sorted_indexed.bam -b2 /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_3_clean_dupsrm_sorted_indexed.bam -o sample3_inputsubt.bw \
--operation subtract \
--binSize 10 \
--extendReads 391 \
--outFileFormat bigwig \
--minMappingQuality 20 \
--ignoreDuplicates \
--scaleFactorsMethod None \
--normalizeUsing CPM \
--exactScaling \
-bl /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/blacklist/ce10-blacklist.bed \
--ignoreForNormalization chrM

bamCompare -b1 /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_4_clean_dupsrm_sorted_indexed.bam -b2 /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_4_clean_dupsrm_sorted_indexed.bam -o sample4_inputsubt.bw \
--operation subtract \
--binSize 10 \
--extendReads 396 \
--outFileFormat bigwig \
--minMappingQuality 20 \
--ignoreDuplicates \
--scaleFactorsMethod None \
--normalizeUsing CPM \
--exactScaling \
-bl /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/blacklist/ce10-blacklist.bed \
--ignoreForNormalization chrM

echo "subtraction complete--bigwigs with input subtracted should be made, now going to make the files with input ratio instead of stubtraction...process started"

bamCompare -b1 /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_2_clean_dupsrm_sorted_indexed.bam -b2 /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_2_clean_dupsrm_sorted_indexed.bam -o sample2_ratio.bw \
--operation ratio \
--binSize 10 \
--extendReads 400 \
--outFileFormat bigwig \
--minMappingQuality 20 \
--ignoreDuplicates \
--scaleFactorsMethod None \
--normalizeUsing CPM \
--exactScaling \
-bl /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/blacklist/ce10-blacklist.bed \
--ignoreForNormalization chrM

bamCompare -b1 /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_3_clean_dupsrm_sorted_indexed.bam -b2 /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_3_clean_dupsrm_sorted_indexed.bam -o sample3_ratio.bw \
--operation ratio \
--binSize 10 \
--extendReads 391 \
--outFileFormat bigwig \
--minMappingQuality 20 \
--ignoreDuplicates \
--scaleFactorsMethod None \
--normalizeUsing CPM \
--exactScaling \
-bl /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/blacklist/ce10-blacklist.bed \
--ignoreForNormalization chrM

bamCompare -b1 /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_4_clean_dupsrm_sorted_indexed.bam -b2 /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_4_clean_dupsrm_sorted_indexed.bam -o sample4_ratio.bw \
--operation ratio \
--binSize 10 \
--extendReads 396 \
--outFileFormat bigwig \
--minMappingQuality 20 \
--ignoreDuplicates \
--scaleFactorsMethod None \
--normalizeUsing CPM \
--exactScaling \
-bl /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/blacklist/ce10-blacklist.bed \
--ignoreForNormalization chrM

echo "input ratio complete, bigwigs should be made"
