import csv
import os
import fnmatch

## collect each .csv file from directory
rawFilesDir = './fitbit-data-raw/'
processedFilesDir = './fitbit-data-processed/'
inputFiles = fnmatch.filter(os.listdir(rawFilesDir), '*.csv')

## open and read each .csv file
for file in inputFiles:
    with open(rawFilesDir+file, 'rb') as f:
        reader = csv.reader(f)
        outputList = list(reader)
    # TODO: re-work the indexing (below) slightly
    ## Set up indexes for start/end of each section. If next section does
    ## not exist, ValueError is thrown, it is the last section of the file.
    bodyList = outputList[outputList.index(['Body'])+1:
    		outputList.index(['Activities'])-1]
    try:
        activitiesList = outputList[outputList.index(['Activities'])+1:
                outputList.index(['Sleep'])-1]
        sleepList = outputList[outputList.index(['Sleep'])+1:
                len(outputList)-1]
    except ValueError:
        activitiesList = outputList[outputList.index(['Activities'])+1:
                len(outputList)-1]
        sleepList = []
    ## Write each section to their own .csv file. Each section will be its
    ## own table with date as the key to link tables.
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
