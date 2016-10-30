import csv
import os
import fnmatch

## collect each .csv file from directory
rawFilesDir = '/home/logan/Documents/code/fitbit-data-analysis/fitbit-data-raw'  # temp hard-coded
files = fnmatch.filter(os.listdir(rawFilesDir), '*.csv')

## open each .csv file and split
for file in files:
    print file


#with open()