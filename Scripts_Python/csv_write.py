# Writes the list of the files in a folder to a csv file.
# Need to change to write only the .fastq.gz file names

import os, csv

with open("/OSM/CBR/AF_DATASCHOOL/output/epl/filenames.csv", 'w') as f:
    writer = csv.writer(f)
    for path, dirs, files in os.walk("/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/"):
        for filename in files:
            writer.writerow([filename])
