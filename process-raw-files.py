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
test = 0

## open each .csv file and split
for file in inputFiles: # loop through each of the raw files
    with open(rawFilesDir+file, 'rb') as f:
        reader = csv.reader(f)
        outputList = list(reader)
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




## add in tomorrow
#bodyList = []
#Bodyobj = ['Body']
#Activitiesobj = ['Activities']
#BodyStarting = outputList.index(Bodyobj)
#BodyEnding = outputList.index(Activities)
#bodyList = outputList[BodyStarting+1:BodyEnding-1]

