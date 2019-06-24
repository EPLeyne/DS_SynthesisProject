#!/bin/bash -l
#SBATCH --job-name=sbatchtest
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=2
#SBATCH --mem=4gb
#SBATCH --time=1:00:00
#SBATCH -a 64
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ley015@csiro.au

module load fastqc/0.11.8 


fastqc /OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/*.fastq.gz -o /OSM/CBR/AF_DATASCHOOL/output/epl/fastqc_results3/ 
-t=64