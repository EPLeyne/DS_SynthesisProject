#!/usr/bin/env bash

#SBATCH --job-name=boss_test
#SBATCH --time=2:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=40GB
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ley015@csiro.au


#-------------------------FILES REQUIRED--------------------------#
# IN THE SAME FOLDER:
	## SCRIPT 1: boss_batch.sh
	## SCRIPT 2: SNP_AUTOMATIC.sh
	## FILE 1: SNP POSIITON FILE (optional)
	## FILE 2 inputList.txt file of samples and id to use.  2 column space delimited file  Col 1 = ID, Col 2 

# IN ANY FOLDER:
	## GENOME.fasta file
	## SAM files

#-----------------------Load required modules---------------------#

#DO NOT CHANGE!!!!!!!!!! 
module load jemalloc
module load python/3.7.2
module load fastqc/0.11.8
# module load trinity 
# module load bowtie
# module load gatk 
# module load star


#------------------------PROJECT VARIABLES-----------------------#

#DO NOT CHANGE!!!!!!!!!!



#------------------------ENVIRONMENTAL VARIABLES-----------------#

#This needs to be changed for your specific directories
export PROJECTNAME=ds_synthesis
export CSIROID=ley015
export INDIR=/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/   	#Directory of raw FASTQ files
export OUTDIR=/flush1/${CSIROID}/${PROJECTNAME}/results
#export TrinityOUTDIR=flush1/........					#Interim output of Trinity
#export TrimFINOUTDIR=OSM/CBR/AF_DATASCHOOL/output/Trimmed		#Output directory of Trimmomatic files transferred
								    	# from flush, created in Trinity
#export TrinityFINOUTDIR=OSM/CBR/AF_DATASCHOOL/output/Trinity		#Output dir of final Trinity files, transferred from flush
#export GENDIR=OSM/CBR/AF_HETEROSIS/work/2018_dataschool/genome		#Genome directory
#export FASTA=Brassica_napus_v4.1.chromosomes.fa

#-----------------------FASTQC VARIABLES-------------------------#
export QCOUTDIR=${OUTDIR}/01_fastqc/

#-----------------------FILELIST VARIABLES-----------------------#



#-----------------------TRINITY VARIABLES------------------------#


#-----------------------BOWTIE VARIABLES-------------------------#





#-----------------------GATK VARIABLES---------------------------#

#Can change if you want to
#export ALLELE=6			#Max allowed alternate alleles DEFAULT = 6
#export PLOIDY=2			#Expected Ploidy DEFAULT = 2
#export GATKQUAL=20.0  	#Minimum allowed quality of SNP
#export WIN=35 			#Looking for window size (bp) containing SNPs  DEFAULT = 35 GATK best practices
#export CLUS=3 			#Number of required SNPs in window to form cluster  DEFAULT = 3 GATK best practices
#export FS=30.0			#Filter SNPs on Fisher strand values  DEFAULT = 30.0 GATK best practices
#export QD=2.0			#Filter quality by depth  DEFAULT = 2.0 GATK best practices


#-----------------------STAR VARIABLES---------------------------#




#-----------------------REQUIRED VARIABLES-----------------------#



#---------------------calling batch job--------------------------#

python ../Scripts_Python/glob_csv_write_filepaths.py "$INDIR" "$OUTDIR"


#GENO=( $(cut -d " " -f 1 inputList.txt) );
#INFILES=( $(cut -d " " -f 2 inputList.txt) );

#USAGE: sbatch -a 0 master_batch.sh
#Only need to alter below line if using -d or not and using -l or not.  

#if [ ! -z "$SLURM_ARRAY_TASK_ID" ]
#then
#    i=$SLURM_ARRAY_TASK_ID
#	exec 1> /OSM/CBR/AF_HETEROSIS/work/2018_dataschool/scripts/${GENO[i]}.log 2>&1
#	bash SNP_AUTOMATIC.sh -c SAM -i /${INDIR}/${INFILES[i]} -g /${GENDIR}/${FASTA} -f ${GENO[i]}
#else
#    echo "Error: Missing array index as SLURM_ARRAY_TASK_ID"
#fi
