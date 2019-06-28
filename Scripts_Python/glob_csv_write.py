# Iterate through the fastq files and send them to a csv file

import glob
import csv
import os

os.chdir("/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/")
globfiles = glob.glob('*.fastq*')


with open("../filenames3.csv", 'w') as f:
    writer = csv.writer(f)
    for filenames in globfiles:
        writer.writerow([filenames])

