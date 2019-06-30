# Iterate through the fastq files and send the names to a csv file

import glob
import csv
import os

globfiles = glob.glob('/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/*.fastq*')
# globfiles = glob.glob('${INPDIR}/*fastq*')

with open("../filenames.csv", 'w') as f:  #Need to create a $filename for projects
    writer = csv.writer(f)
    writer.writerow(['sample_id', 'test'])
    for filenames in globfiles:
        writer.writerow([os.path.basename(filenames),'1'],)

