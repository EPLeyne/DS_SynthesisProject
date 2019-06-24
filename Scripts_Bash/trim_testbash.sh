\module load trimmomatic/0.38

trim_path='/apps/trimmomatic/0.38/trimmomatic-0.38.jar' 
fwd_path='../CA73YANXX_8_161220_BPO--000_Other_TAAGGCGACTCTCTAT_R_161128_SHADIL_LIB2500_M002_R1.fastq.gz' 
rev_path='../CA73YANXX_8_161220_BPO--000_Other_TAAGGCGACTCTCTAT_R_161128_SHADIL_LIB2500_M002_R2.fastq.gz' 
out_path='../000_test.fastq.gz'
log_path='../000test.trimlog'

#trim_path='/apps/trimmomatic/0.38/trimmomatic-0.38.jar'
#fwd_path='~/DATASCHOOL/DS_SynthesisProject/CA73YANXX_8_161220_BPO--000_Other_TAAGGCGACTCTCTAT_R_161128_SHADIL_LIB2500_M002_R1.fastq.gz'
#rev_path='~/DATASCHOOL/DS_SynthesisProject/CA73YANXX_8_161220_BPO--000_Other_TAAGGCGACTCTCTAT_R_161128_SHADIL_LIB2500_M002_R2.fastq.gz'
#out_path='~/DATASCHOOL/DS_SynthesisProject/000_test.fastq.gz'
#log_path='~/DATASCHOOL/DS_SynthesisProject/000test.trimlog'

java -jar $trim_path PE -phred33 \
-trimlog $log_path \
$fwd_path \
$rev_path \
-baseout $out_path \
LEADING:3 \
TRAILING:3 \
ILLUMINACLIP:TrueSeq3-PE.fa:2:30:10
