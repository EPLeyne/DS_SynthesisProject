# Iterate through the fastq files and send the names to a csv file

import glob
import csv
import os
import pandas as pd
import sys

globfiles = glob.glob('/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/*.fastq*')
# globfiles = glob.glob('${INPDIR}/*fastq*')

with open("../filenames.csv", 'w') as f:  #Need to create a $filename for projects
    writer = csv.writer(f)
    writer.writerow(['sample_id', 'test'])
    for filenames in globfiles:
        writer.writerow([os.path.basename(filenames),'1'],)

fwdglobfiles = glob.glob('/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/*R1.fastq*')
revglobfiles = glob.glob('/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/*R2.fastq*')

with open("../fwd_filenames.csv", 'w') as g:  #Need to create a $filename for projects
    writerfwd = csv.writer(g)
    writerfwd.writerow(['key','fwd_sample_id'])
    for fwdfilenames in fwdglobfiles:
        writerfwd.writerow([os.path.basename(fwdfilenames)[34:51],os.path.basename(fwdfilenames)])

with open("../rev_filenames.csv", 'w') as g:  #Need to create a $filename for projects
    writerrev = csv.writer(g)
    writerrev.writerow(['key','rev_sample_id'])
    for revfilenames in revglobfiles:
        writerrev.writerow([os.path.basename(revfilenames)[34:51],os.path.basename(revfilenames)])

df1 = pd.read_csv('../fwd_filenames.csv')
df2 = pd.read_csv('../rev_filenames.csv')
df3 = df1.merge(df2, on = 'key').to_csv(sys.stdout, index = False)
df3.to_csv(r'../split_filenames.csv')


# with open("../split_filenames.csv", 'w') as g:
#     writer1 = csv.writer(g)
#     writer1.writerow(['fwd_sampleid','rev_sampleid','test'])
#     for filenames in globfiles:
#         if filenames == ('*r1*')
#             writer1.writerow(os.path.basename(filenames))
#         else:
#             writer1.writerow(os.path.basename(filenames),1)
