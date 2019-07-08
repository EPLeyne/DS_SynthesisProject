# Iterate through the fastq files and send the names to a csv file
# Requires the inputs from the boss_batch.sh to be entered first and run through that file
# If adapting to a script with out boss_batch.sh......
# Call with..
# module load python/3.7.2
# python scriptname.py

import glob
import csv
import os
import pandas as pd
import sys

# Assign the external variables from boss_batch.sh
INDIR = sys.argv[1]
OUTDIR = sys.argv[2]

# Change the directory to the input directory to make the glob files
os.chdir(INDIR)

# Create the lists of files in the input directory for the array and trinity 
globfiles = [i for i in glob.glob('*.fastq*')]
fwdglobfiles = [i for i in glob.glob('*R1.fastq*')]
revglobfiles = [i for i in glob.glob('*R2.fastq*')]

# Make the directory 
try: 
    os.makedirs(OUTDIR)
except FileExistsError:
    pass
os.chdir(OUTDIR)

# Create the filename csv for batch array
with open("filenames.csv", 'w') as f:
    writer = csv.writer(f)
    writer.writerow(['sample_id', 'test'])
    for filenames in globfiles:
         writer.writerow([os.path.basename(filenames),'1'])

# Create the list of fwd and rev files for Trinity
with open("fwd_filenames.csv", 'w') as g:
    writerfwd = csv.writer(g)
    writerfwd.writerow(['key','fwd_sample_id'])
    for fwdfilenames in fwdglobfiles:
        writerfwd.writerow([os.path.basename(fwdfilenames)[34:51],os.path.basename(fwdfilenames)])
with open("rev_filenames.csv", 'w') as h:
    writerrev = csv.writer(h)
    writerrev.writerow(['key','rev_sample_id'])
    for revfilenames in revglobfiles:
        writerrev.writerow([os.path.basename(revfilenames)[34:51],os.path.basename(revfilenames)])

#Merge the fwd and rev files and make txt file for Trinity
df1 = pd.read_csv('fwd_filenames.csv')
df2 = pd.read_csv('rev_filenames.csv')
df3 = df1.merge(df2, on = 'key')
df3 = df3.assign(rep=1)[['rep'] + df3.columns.tolist()]
df3 = df3[['key','rep','fwd_sample_id','rev_sample_id']]
#df3.to_csv(r'split_filenames.csv', index=False, header=False)
df3.to_csv(r'split_filenames.txt', index=False, header=False, sep='\t', mode='a')