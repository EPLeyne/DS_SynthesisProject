#!/bin/bash

#SBATCH --job-name=trinity
#SBATCH --time=06:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=40GB
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ley015@csiro.au

module load trinity/2.3.2

cd ~/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome
#OUTDIR=/flush1/ley015/trinity_output

Trinity --seqType fq --max_memory 50G \
--samples_file ../split_filenames.txt \
--output /flush1/ley015/trinity_output \
--CPU 6 --trimmomatic




#INFILES_R1_LIST=( $(cut -d , -f 2 ../split_filenames.csv) );
#INFILES_R2_LIST=( $(cut -d , -f 3 ../split_filenames.csv) );

#if [ ! -z '$SLURM_ARRAY_TASK_ID' ]
#then
#    i=$SLURM_ARRAY_TASK_ID
#    INFILES_R1=${INPDIR}/${INFILES_R1_LIST}
#    INFILES_R2=${INPDIR}/${INFILES_R1_LIST}
#    (Trinity --seqType fq --max_memory 50G --left ${INFILES_R1} --right ${INFILES_R2} --output ${OUTDIR} --CPU 10 --trimmomatic)
#else
#    echo 'Error: Missing array index as SLURM_ARRAY_TASK_ID'
#fi
