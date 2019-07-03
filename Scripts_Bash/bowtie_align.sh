#!/bin/bash

#***************************************************************#
#            Generate Viral Genome Index POMV and ISA           #
#***************************************************************#

#--------------------------sbatch header------------------------#

#SBATCH --job-name=bowtie_index
#SBATCH --time=00:00:10
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=1GB
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ley015@csiro.au
#SBATCH --output=../Logs/bowtie_index_%A.out

#---------------------------------------------------------------#

module load bowtie

INXDIR=/flush1/ley015/wheat_fasta
READSDIR=../testrun_results
OUTDIR=/flush1/ley015

bowtie2 -p 8 -x ${IDXDIR}/CS.fasta \
-1 ${READSDIR}/000_test_1P.fastq.gz \
-2 ${READSDIR}/000_test_2P.fastq.gz  \
-S ${OUTDIR}/BOWTIE_unmapped.sam 2> ${OUTDIR}/BOWTIE_unmapped.log
fi
