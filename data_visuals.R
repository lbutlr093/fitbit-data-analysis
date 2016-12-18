data_visuals <- function() {
  ## The end result of this function is to return several visual
  ## representations of the data collected. The goal is to break
  ## the data into logical groups to determine the impact of
  ## different factors on my workout and general activity.
  
  library(ggplot2)
  
  ## TODO: hard-coded for now, will play with passing parameters later
  setwd("/home/logan/Documents/code/fitbit-data-analysis/fitbit_data_processed")
  
  activities_data_frame <- read.csv("all_activities.csv")
  measurements_data_frame <- read.csv("all_measurements.csv")
  
  ## Starting simple with histograms
  distance_hist <- ggplot(activities_data_frame[which(activities_data_frame$Distance>0),], aes(x = Distance)) + geom_histogram()
  ggsave(filename="../data_visualization/distance_histogram.png", plot=distance_hist)
  
  #need to convert steps column to numeric
  #ggplot(activities_data_frame[which(activities_data_frame$Steps>0),], aes(x = Steps)) + geom_histogram()
}