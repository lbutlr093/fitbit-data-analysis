data_cleanse <- function() {
  ## The purpose of this function is to take the files that have been split
  ## into each type and clean them for analysis/visual representation. 
  
  ## TODO: hard-coded for now, will change in the future
  setwd("/home/logan/Documents/code/fitbit-data-analysis/fitbit_data_processed")
  
  ## Collect all .csv files in directory, and set up dataframes for each type of file
  filesVector <- list.files(pattern="*.csv")
  activities_data_frame <- data.frame()
  body_data_frame <- data.frame()
  # sleep_data_frame <- 
  # food_data_frame <-
  
  ## Read and sorting by type of file - append to the corresponding dataframe
  for (index in seq_along(filesVector)) { 
    reading <- read.csv(filesVector[index])
    if (grepl(".*activities.*", filesVector[index])) {
      activities_data_frame <- rbind(activities_data_frame, reading)
    } else if (grepl(".*body.*", filesVector[index])) {
      body_data_frame <- rbind(body_data_frame, reading)
    }
  }
  
  ## Adding a new column with day of the week
  activities_data_frame[, "Week.Day"] <- NA
  body_data_frame[, "Week.Day"] <- NA
  
  activities_data_frame$Week.Day <- weekdays(as.Date(activities_data_frame$Date))
  body_data_frame$Week.Day <- weekdays(as.Date(body_data_frame$Date))
  
  ## Order by date - should be in order already, but in case the files were read in a different order
  activities_data_frame <- activities_data_frame[order(activities_data_frame$Date),]
  body_data_frame <- body_data_frame[order(body_data_frame$Date),]
  # sleep_data_frame
  # food_data_frame
  
  ## Remove previous monthly files, consolidated into 1 file for each table
  activities_junk_files <- dir(pattern="activities_.*.csv")
  body_junk_files <- dir(pattern="body_.*.csv")
  file.remove(activities_junk_files, body_junk_files)
  
  ## Write each type out to file
  write.csv(activities_data_frame, file = "all_activities.csv", row.names = FALSE)
  write.csv(body_data_frame, file = "all_measurements.csv", row.names = FALSE) # changed from 'body' to 'measurements' - sounds better
  # sleep_data_frame <- 
  # food_data_frame <- 
}