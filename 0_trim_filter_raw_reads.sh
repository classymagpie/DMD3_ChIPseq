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
bbduk.sh -Xmx1g in=HGVGWAFX2_n01_S2new.fastq.gz out=chip_sample_2_clean.fastq ref=/scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/adaptors.fa ktrim=r k=11 mink=11 hdist=1 tpe tbo qtrim=rl trimq=10
bbduk.sh -Xmx1g in=HGVGWAFX2_n01_S3new.fastq.gz out=chip_sample_3_clean.fastq ref=/scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/adaptors.fa ktrim=r k=11 mink=11 hdist=1 tpe tbo qtrim=rl trimq=10
bbduk.sh -Xmx1g in=HGVGWAFX2_n01_S4new.fastq.gz out=chip_sample_4_clean.fastq ref=/scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/adaptors.fa ktrim=r k=11 mink=11 hdist=1 tpe tbo qtrim=rl trimq=10

#SAMPLES
bbduk.sh -Xmx1g in=HGVGWAFX2_n01_I2new.fastq.gz out=chip_input_2_clean.fastq ref=/scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/adaptors.fa ktrim=r k=11 mink=11 hdist=1 tpe tbo qtrim=rl trimq=10
bbduk.sh -Xmx1g in=HGVGWAFX2_n01_I3new.fastq.gz out=chip_input_3_clean.fastq ref=/scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/adaptors.fa ktrim=r k=11 mink=11 hdist=1 tpe tbo qtrim=rl trimq=10
bbduk.sh -Xmx1g in=HGVGWAFX2_n01_I4new.fastq.gz out=chip_input_4_clean.fastq ref=/scratch/pf887/chipseq/NewChIPData/porfirio/2020-08-27_HGVGWAFX2/merged/adaptors.fa ktrim=r k=11 mink=11 hdist=1 tpe tbo qtrim=rl trimq=10

fastqc *clean*
multiqc .
