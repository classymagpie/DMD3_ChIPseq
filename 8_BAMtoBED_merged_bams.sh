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

# use command " bedtools bamtobed -i chip_merged.bam > chip_merged.bed


echo "from bam to bed initiated"

bedtools bamtobed -i /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/mergedBAM/chip_merged.bam > /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/mergedBAM/chip_merged.bed
bedtools bamtobed -i /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/mergedBAM/input_merged.bam > /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/mergedBAM/input_merged.bed

echo "from bam to bed completed"
