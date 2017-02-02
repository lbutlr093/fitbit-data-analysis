tv3 <- function() {
  setwd("~/Documents/code/fitbit-data-analysis/")
  full_2016 <- read.csv("fitbit_data_processed/activities_2016_01.csv")
  full_2017 <- read.csv("fitbit_data_processed/activities_2017_01.csv")
  workout_2016 <- read.csv("other_data/jan_2016.csv")
  workout_2017 <- read.csv("other_data/jan_2017.csv")
  
  merged_2016 <- merge(full_2016, workout_2016, by.x = "Date", incomparables = NA, all = TRUE)
  merged_2017 <- merge(full_2017, workout_2017, by.x = "Date", incomparables = NA, all = TRUE)
  merged_2016$Workout.Steps[is.na(merged_2016$Workout.Steps)] <- 0
  merged_2017$Workout.Steps[is.na(merged_2017$Workout.Steps)] <- 0
  
  merged_2017$Adjusted.Steps <- merged_2017$Steps - merged_2017$Workout.Steps
  #Remove comma from "Steps"
  #as.numeric(as.character($Steps))
}