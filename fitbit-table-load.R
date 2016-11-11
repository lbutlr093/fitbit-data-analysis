fitbit-table-load <- function() {
  
  ## TODO: hard-coded for now, will play with passing parameters later
  setwd("/home/logan/Documents/code/fitbit-data-analysis/fitbit-data-processed")
  
  filesVector <- list.files(pattern="*.csv")
  
  for (index in seq_along(filesVector)) { 
    ## read csv files from filesVector
    print(filesVector[index])
  }
  
}
## append each .csv into each vector
# activitiesVector
# bodyVector

## order by date
# activitiesVector <- arrange(activitiesVector, date)
# bodyVector <- arrange(bodyVector, date)