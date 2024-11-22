# DMD3_ChIPseq

#scripts used to analyze C. elegans L4 male DMD-3 ChIP-seq data

#This file contains an overview of the steps used, shell scripts are provided as individual files.

#----------------------------------------------------------------------------

0_trim_filter_raw_reads.sh

#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=5:00:00
#SBATCH --mem=2GB
#SBATCH --job-name=bbduk_chip
#SBATCH --mail-type=END
#SBATCH --mail-user=pf887@nyu.edu
#SBATCH --output=slurm_%j.out
 
module purge

module load bbmap/38.42
module load fastqc/0.11.8
module load multiqc/intel/1.7
#module load pigz/intel/2.3.4


#SAMPLES
bbduk.sh -Xmx1g in=HGVGWAFX2_n01_S2new.fastq.gz out=chip_sample_2_clean.fastq ref=/scratch/wa23/chip_2020/2020-08-27_HGVGWAFX2/merged/adapters.fa ktrim=r k=11 mink=11 hdist=1 tpe tbo qtrim=rl trimq=10
bbduk.sh -Xmx1g in=HGVGWAFX2_n01_S3new.fastq.gz out=chip_sample_3_clean.fastq ref=/scratch/wa23/chip_2020/2020-08-27_HGVGWAFX2/merged/adapters.fa ktrim=r k=11 mink=11 hdist=1 tpe tbo qtrim=rl trimq=10
bbduk.sh -Xmx1g in=HGVGWAFX2_n01_S4new.fastq.gz out=chip_sample_4_clean.fastq ref=/scratch/wa23/chip_2020/2020-08-27_HGVGWAFX2/merged/adapters.fa ktrim=r k=11 mink=11 hdist=1 tpe tbo qtrim=rl trimq=10

#SAMPLES
bbduk.sh -Xmx1g in=HGVGWAFX2_n01_I2new.fastq.gz out=chip_input_2_clean.fastq ref=/scratch/wa23/chip_2020/2020-08-27_HGVGWAFX2/merged/adapters.fa ktrim=r k=11 mink=11 hdist=1 tpe tbo qtrim=rl trimq=10
bbduk.sh -Xmx1g in=HGVGWAFX2_n01_I3new.fastq.gz out=chip_input_3_clean.fastq ref=/scratch/wa23/chip_2020/2020-08-27_HGVGWAFX2/merged/adapters.fa ktrim=r k=11 mink=11 hdist=1 tpe tbo qtrim=rl trimq=10
bbduk.sh -Xmx1g in=HGVGWAFX2_n01_I4new.fastq.gz out=chip_input_4_clean.fastq ref=/scratch/wa23/chip_2020/2020-08-27_HGVGWAFX2/merged/adapters.fa ktrim=r k=11 mink=11 hdist=1 tpe tbo qtrim=rl trimq=10

fastqc *clean*
multiqc .


-----------------------------------------





