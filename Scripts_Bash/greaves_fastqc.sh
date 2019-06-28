#!/usr/bin/env bash

#SBATCH --job-name=looptest
#SBATCH --time=1:00:00
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=20
#SBATCH --exclusive
#SBATCH --mem=32GB
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ley015@csiro.au

module load fastqc/0.11.5

#SAMPLES=( $(cut -d " " -f 1 fastqcInputList.csv) );
INFILES=( $(cut -d , -f 1 filenames.csv) );

if [ ! -z "$SLURM_ARRAY_TASK_ID" ]
then
    i=$SLURM_ARRAY_TASK_ID
    fastqc /OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/${INFILES[$i]} -o /OSM/CBR/AF_DATASCHOOL/output/epl/fastqc_results3/
else
    echo "Error: Missing array index as SLURM_ARRAY_TASK_ID"
f




#----------------------project variables------------------------#
#IN_DIR=/OSM/CBR/AF_DATASCHOOL/input/input/2019-04-12_Transcritome
#OUT_DIR=/OSM/CBR/AF_DATASCHOOL/output/epl/fastqc_results3/
#---------------------------------------------------------------#

#module load fastqc/0.11.5

#IN_FILE_LIST=( $(cut -d , -f 1 filenames.csv ) );

#if [ ! -z "$SLURM_ARRAY_TASK_ID" ]
#    then
#        i=$SLURM_ARRAY_TASK_ID
#        IN_FILE=${IN_DIR}/${IN_FILE_LIST[$i]}
#        fastqc ${IN_FILE} --noextract -o ${OUT_DIR}
#    else
#        echo "Error: Missing array index as SLURM_ARRAY_TASK_ID"
#fi


#module load fastqc/0.11.8


