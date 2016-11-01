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
	# TODO: if sleep / food exist, conditionally set the following lists.
	# TODO: foodsList = 
    activitiesList = outputList[outputList.index(['Activities'])+1:len(outputList)-1]
    # TODO: sleepList = 
    with open(processedFilesDir+'body_'+file, 'wb') as bodyWriter:
        writer = csv.writer(bodyWriter)
        writer.writerows(bodyList) # changed from outputList
    with open(processedFilesDir+'activities_'+file, 'wb') as activitiesWriter:
        writer2 = csv.writer(activitiesWriter)
        writer2.writerows(activitiesList) # change this to ActivitiesList
