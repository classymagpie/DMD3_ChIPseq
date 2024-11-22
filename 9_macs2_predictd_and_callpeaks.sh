#!/bin/bash
#
#BATCH --verbose
#SBATCH --job-name=MACS
#SBATCH --time=03:00:00
#SBATCH --nodes=1
#SBATCH --mem=40GB

module load macs2/intel/2.1.1

echo "start calculating predicted fragment size"
#do this to the merged bam file

#10.   calculate predicted fragment size:
#macs2 predictd -i ${chip}.bed &> ${val}.txt
#fragment_size=$(grep -E -o 'predicted fragment length is [[:digit:]]+' ${val}.txt | grep -E -o '[[:digit:]]+')

macs2 predictd -i /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/mergedBAM/chip_merged.bed &> fragsize.txt
fragment_size=$(grep -E -o 'predicted fragment length is [[:digit:]]+' fragsize.txt | grep -E -o '[[:digit:]]+')

echo "prediction done, moving to call peaks" 
#11.   call macs2 peaks:
#macs2 callpeak -t ${chip}.bed -c ${input}.bed --outdir MACSoutput -f BED -g ce -n $name -q 0.05 --nomodel --extsize $fragment_size

macs2 callpeak -t /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/mergedBAM/chip_merged.bed -c /scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/BAM/mergedBAM/input_merged.bed --outdir MACSoutput -f BED -g ce -n MACS2_callpeaks_on_merged -q 0.05 --nomodel --extsize $fragment_size

echo "call peaks finished"
