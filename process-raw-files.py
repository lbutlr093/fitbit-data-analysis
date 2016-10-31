import csv
import os
import fnmatch

## collect each .csv file from directory
rawFilesDir = './fitbit-data-raw/'  # temp hard-coded
processedFilesDir = './fitbit-data-processed/'  # temp hard-coded
inputFiles = fnmatch.filter(os.listdir(rawFilesDir), '*.csv')
#print inputFiles

## Setup readers and writers 
#rawInput = 
#bodyOutput = 
#foodsOutput = 
#activitiesOutput = 
#sleepOutput = 
testOutput = []
outputList = []

## open each .csv file and split
for file in inputFiles: # loop through each of the raw files
    with open(rawFilesDir+file, 'rb') as f:
        reader = csv.reader(f)
        outputList = list(reader)
        #for row in reader:
            #testOutput += row
    with open(processedFilesDir+'processed_'+file, 'wb') as f2:
        writer = csv.writer(f2)
        writer.writerows(outputList)
		
		
#inputFile = open(rawFilesDir+'2015_05.csv', 'rb')
#reader = csv.reader(inputFile)
#for row in reader:
#	if row == "Activities":
#		print row
#	print row
#inputFile.close()
