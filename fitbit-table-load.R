fitbit-table-load <- function() {
  
  ## TODO: hard-coded for now, will play with passing parameters later
  setwd("~/Documents/code/fitbit-data-analysis/fitbit-data")
  
  filesVector <- list.files(pattern="*.csv")
  
  for (index in seq_along(filesVector)) { 
    ## read csv files from filesVector
    filesVector[index] <- 
  }
  
}