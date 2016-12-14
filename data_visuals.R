data_visuals <- function() {
  ## The end result of this function is to return several visual
  ## representations of the data collected. The goal is to break
  ## the data into logical groups to determine the impact of
  ## different factors on my workout and general activity.
  
  ## TODO: hard-coded for now, will play with passing parameters later
  setwd("/home/logan/Documents/code/fitbit-data-analysis/fitbit_data_processed")
  
  measurement_file <- read.csv("all_measurements.csv")
  activity_file <- read.csv("all_activities.csv")
  
}