# Path to Trimmomatic jar
trim_path = '/apps/trimmomatic/0.38/trimmomatic-0.38.jar'

module load trimmomatic/0.38

java -jar /apps/trimmomatic/0.38/trimmomatic-0.38.jar -phred33 \
-trimlog  /OSM/CBR/AF_DATASCHOOL/output/epl/trim_results/000test.trimlog \
/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/CA73YANXX_8_161220_BPO--000_Other_TAAGGCGA-CTCTCTAT_R_161128_SHADIL_LIB2500_M002_R1.fastq.gz \
/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/CA73YANXX_8_161220_BPO--000_Other_TAAGGCGA-CTCTCTAT_R_161128_SHADIL_LIB2500_M002_R2.fastq.gz \
-baseout /OSM/CBR/AF_DATASCHOOL/output/epl/trim_results/000_trimmed.fastq.gz 
