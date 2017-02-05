jan_steps <- function() {
  ## This function will take a comparison of the average steps walked in the month of January
  ## between 2016 and 2017. The purpose for running this project is my suspicion that I am
  ## much more active at my current client this year than I was at a different client
  ## last year. I will take the total steps each day and subtract the number of steps that 
  ## are tracked in exercise to normalize the data to the "workday" steps.
  
  library(ggplot2)
  library(lubridate)
  setwd("~/Documents/code/fitbit-data-analysis/")
  
  full_2016 <- read.csv("fitbit_data_processed/activities_2016_01.csv")
  full_2017 <- read.csv("fitbit_data_processed/activities_2017_01.csv")
  workout_2016 <- read.csv("other_data/jan_2016.csv")
  workout_2017 <- read.csv("other_data/jan_2017.csv")
  
  merged_2016 <- merge(full_2016, workout_2016, by.x = "Date", incomparables = NA, all = TRUE)
  merged_2017 <- merge(full_2017, workout_2017, by.x = "Date", incomparables = NA, all = TRUE)
  merged_2016$Workout.Steps[is.na(merged_2016$Workout.Steps)] <- 0 # Force NA values to 0 - easier for operations in this case
  merged_2017$Workout.Steps[is.na(merged_2017$Workout.Steps)] <- 0
  merged_2016$Steps <- as.numeric(sub(",", "", merged_2016$Steps, fixed = TRUE)) # Allow Steps to be converted to numeric for operations
  merged_2017$Steps <- as.numeric(sub(",", "", merged_2017$Steps, fixed = TRUE))
  merged_2016$Adjusted.Steps <- merged_2016$Steps - merged_2016$Workout.Steps # Adjusted steps = (Total steps - Workout steps)
  merged_2017$Adjusted.Steps <- merged_2017$Steps - merged_2017$Workout.Steps
  jan_df <- rbind(merged_2016, merged_2017)
  
  jan_analysis_violin_plot <- ggplot(aes(y = Adjusted.Steps, x = factor(year(Date))), data = jan_df[which(jan_df$Adjusted.Steps>0),]) +
    geom_violin(scale = "area") +
    ggtitle("January Step Analysis") +
    labs(x = "Year", y = "Steps") +
    theme(plot.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=16, hjust=0.5)) +
    theme(axis.text.x = element_text(face="bold", color="#000000", size=12),
          axis.text.y = element_text(face="bold", color="#000000", size=12)) +
    theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=14))
  getwd()
  ggsave(filename = "data_visualization/january_analysis.png", plot = jan_analysis_violin_plot)
}

jan_steps()