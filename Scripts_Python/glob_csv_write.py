# Iterate through the fastq files and send the names to a csv file

import glob
import csv
import os

<<<<<<< HEAD
globfiles = glob.glob('/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/*.fastq*')
# globfiles = glob.glob('${INPDIR}/*fastq*')
=======
os.chdir("/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/")
globfiles = glob.glob('*.fastq*')
>>>>>>> c1c5ddc32819a12fb401208d1b26efc965490fdc

with open("../filenames.csv", 'w') as f:  #Need to create a $filename for projects
    writer = csv.writer(f)
    writer.writerow(['sample_id', 'test'])
    for filenames in globfiles:
        writer.writerow([os.path.basename(filenames),'1'],)

