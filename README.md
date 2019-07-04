# DS_SynthesisProject
Synthesis Project for the Data School, pipeline for OW


File structure: where 'home/' = project home directory

home/data/raw/*fastq.gz

/flush1/${csiroID}/${projectName}/results/01_fastqc/...

/flush1/${csiroID}/${projectName}/results/02_trinity/...

/flush1/${csiroID}/${projectName}/results/03_bowtie/...


/flush1/${csiroID}/${projectName}/results/04_trimmomatic/...

/flush1/${csiroID}/${projectName}/results/05_fastqc_trim/...

/flush1/${csiroID}/${projectName}/results/06_star/...

/flush1/${csiroID}/${projectName}/results/07_gatk/...

Selected results to be kept are then automatically transferred to Bowen
eg.
/OSM/CBR/AF_DATASCHOOL/output/epl/01_fastqc/...

${OUTPUTDIR}/01_fastqc/...


Trimmomatic notes....

trim_testrun contains the test of trimmomatic on one file

trim log contains:
1. read name
2. surviving sequence length
3. location of first surviving base
4. location of last surviving base
5. the amount trimmed from the end.


cont....
