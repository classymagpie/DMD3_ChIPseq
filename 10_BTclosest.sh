#!/bin/bash
#
#BATCH --verbose
#SBATCH --job-name=btCLOSEST
#SBATCH --time=19:00:00
#SBATCH --nodes=1
#SBATCH --mem=60GB
#SBATCH --mail-type=ALL

##
## NOTE: This script is specific to the ChIP-seq pipeline
##
echo "start"
#Load in required tools
module purge
module load bedtools/intel/2.27.1


#plus minus 2000bp

bedtools closest -t all -a /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/tss/merged_allpeaks.bed -b /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/tss/4kb_window/tss_4kb_sorted.bed > /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/tss/4kb_window/Genelist_4kbwindow.bed  

echo "finished"
