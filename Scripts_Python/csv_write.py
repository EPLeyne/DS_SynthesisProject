import os, csv

with open("/OSM/CBR/AF_DATASCHOOL/output/epl/", 'w') as f:
    writer = csv.writer(f)
    for path, dirs, files in os.walk("/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/*.fastq.gz"):
        for filename in files:
            w.writerow([filename])
