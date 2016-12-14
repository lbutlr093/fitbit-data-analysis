fitbit_table_load <- function() {
  ## TODO: hard-coded for now, will play with passing parameters later
  setwd("/home/logan/Documents/code/fitbit-data-analysis/fitbit_data_processed")
  
  ## Collect all .csv files in directory, and set up dataframes for each type of file
  filesVector <- list.files(pattern="*.csv")
  activities_data_frame <- data.frame()
  body_data_frame <- data.frame()
  #sleep_data_frame <- 
  #food_data_frame <-
  
  ## Read each file in the processed files directory (contained in filesVector)
  for (index in seq_along(filesVector)) { 
    reading <- read.csv(filesVector[index])
    ## Sort by type of file, and append the according data frame
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
  #sleep_data_frame
  #food_data_frame
  
  ## Remove previous monthly files, consolidated into 1 file for each table
  activities_junk_files <- dir(pattern="activities_.*.csv")
  body_junk_files <- dir(pattern="body_.*.csv")
  file.remove(activities_junk_files, body_junk_files)
  
  ## Write each type out to file
  write.csv(activities_data_frame, file = "all_fitbit_activities.csv", row.names = FALSE)
  write.csv(body_data_frame, file = "all_fitbit_body.csv", row.names = FALSE)
  #sleep_data_frame <- 
  #food_data_frame <- 
}