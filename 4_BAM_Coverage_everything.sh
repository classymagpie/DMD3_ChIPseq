#!/bin/bash
#
#BATCH --verbose
#SBATCH --job-name=bamCoverage
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
echo "Start coverage bams at: $start"


#deeptools/3.3.1
#8.      generate coverage file for input and chip:
#bamCoverage --bam chip or input.bam -o $chip or input_raw_coverage \
#--binSize 100 \
#--extendReads 200 \
#--outFileFormat bedgraph \
#--minMappingQuality 20 \ 
#--ignoreDuplicates \ 
#--normalizeUsing CPM \
#   	--exactScaling \
#   	-bl /scratch/cgsb/ercan/annot/ce10-blacklist.bed \
#--ignoreForNormalization chrM
#may not need ignore dups /qscore command command because we filtered them out. 

bamCoverage --bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_2_clean_dupsrm_sorted_indexed.bam -o /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_2_clean_dupsrm_sorted_indexed_raw_coverage \
--binSize 100 \
--extendReads 390 \
--outFileFormat bedgraph \
--minMappingQuality 20 \
--ignoreDuplicates \
--normalizeUsing CPM \
--exactScaling \
-bl /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/blacklist/ce10-blacklist.bed \
--ignoreForNormalization chrM

bamCoverage --bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_3_clean_dupsrm_sorted_indexed.bam -o /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_3_clean_dupsrm_sorted_indexed_raw_coverage \
--binSize 100 \
--extendReads 386 \
--outFileFormat bedgraph \
--minMappingQuality 20 \
--ignoreDuplicates \
--normalizeUsing CPM \
--exactScaling \
-bl /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/blacklist/ce10-blacklist.bed \
--ignoreForNormalization chrM

bamCoverage --bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_4_clean_dupsrm_sorted_indexed.bam -o /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_sample_4_clean_dupsrm_sorted_indexed_raw_coverage \
--binSize 100 \
--extendReads 382 \
--outFileFormat bedgraph \
--minMappingQuality 20 \
--ignoreDuplicates \
--normalizeUsing CPM \
--exactScaling \
-bl /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/blacklist/ce10-blacklist.bed \
--ignoreForNormalization chrM

bamCoverage --bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_2_clean_dupsrm_sorted_indexed.bam -o /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_2_clean_dupsrm_sorted_indexed_raw_coverage \
--binSize 100 \
--extendReads 410 \
--outFileFormat bedgraph \
--minMappingQuality 20 \
--ignoreDuplicates \
--normalizeUsing CPM \
--exactScaling \
-bl /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/blacklist/ce10-blacklist.bed \
--ignoreForNormalization chrM

bamCoverage --bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_3_clean_dupsrm_sorted_indexed.bam -o /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_3_clean_dupsrm_sorted_indexed_raw_coverage \
--binSize 100 \
--extendReads 397 \
--outFileFormat bedgraph \
--minMappingQuality 20 \
--ignoreDuplicates \
--normalizeUsing CPM \
--exactScaling \
-bl /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/blacklist/ce10-blacklist.bed \
--ignoreForNormalization chrM

bamCoverage --bam /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_4_clean_dupsrm_sorted_indexed.bam -o /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/BAMs_w_rvm_duplicates/chip_input_4_clean_dupsrm_sorted_indexed_raw_coverage \
--binSize 100 \
--extendReads 411 \
--outFileFormat bedgraph \
--minMappingQuality 20 \
--ignoreDuplicates \
--normalizeUsing CPM \
--exactScaling \
-bl /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/blacklist/ce10-blacklist.bed \
--ignoreForNormalization chrM

echo "Coverage Bam complete"
