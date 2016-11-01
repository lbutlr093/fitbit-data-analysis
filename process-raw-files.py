import csv
import os
import fnmatch

## collect each .csv file from directory
rawFilesDir = './fitbit-data-raw/'  # temp hard-coded
processedFilesDir = './fitbit-data-processed/'  # temp hard-coded
inputFiles = fnmatch.filter(os.listdir(rawFilesDir), '*.csv')

## open each .csv file and split
for file in inputFiles: # loop through each of the raw files
    with open(rawFilesDir+file, 'rb') as f:
        reader = csv.reader(f)
        outputList = list(reader)
    ## set up the indexes for each section in the raw .csv file
    bodyList = outputList[outputList.index(['Body'])+1:outputList.index(['Activities'])-1]
    try:
        activitiesList = outputList[outputList.index(['Activities'])+1:outputList.index(['Sleep'])-1]
        sleepList = outputList[outputList.index(['Sleep'])+1:len(outputList)-1]
    except ValueError:
		activitiesList = outputList[outputList.index(['Activities'])+1:len(outputList)-1]
		sleepList = []
    # TODO: foodsList = 
    with open(processedFilesDir+'body_'+file, 'wb') as bodyWriter:
        writer = csv.writer(bodyWriter)
        writer.writerows(bodyList)
    with open(processedFilesDir+'activities_'+file, 'wb') as activitiesWriter:
        writer2 = csv.writer(activitiesWriter)
        writer2.writerows(activitiesList)
    if len(sleepList) != 0:
        with open(processedFilesDir+'sleep_'+file, 'wb') as sleepWriter:
            writer3 = csv.writer(sleepWriter)
            writer3.writerows(sleepList)
