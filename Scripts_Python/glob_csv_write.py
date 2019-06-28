# Iterate through the fastq files and send them to a csv file

import glob
import csv

globfiles = glob.glob('/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/*.fastq.gz')


with open("../filenames3.scv", 'w') as f:
    writer = csv.writer(f)
    for filenames in globfiles:
        writer.writerow([filenames])

