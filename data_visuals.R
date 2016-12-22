data_visuals <- function() {
  ## The end result of this function is to return several visual
  ## representations of the data collected. The goal is to break
  ## the data into logical groups to determine the impact of
  ## different factors on my workout and general activity.
  
  library(ggplot2)
  library(lubridate)
  
  ## TODO: hard-coded for now, will play with passing parameters later
  setwd("/home/logan/Documents/code/fitbit-data-analysis/fitbit_data_processed")
  
  activities_data_frame <- read.csv("all_activities.csv")
  measurements_data_frame <- read.csv("all_measurements.csv")
  
  activities_data_frame$Steps <- as.integer(sub(",", "", activities_data_frame$Steps))
  activities_data_frame$Date <- as.Date(activities_data_frame$Date)
  
  ## Mean / Median without zero values
  distance_median <- median(activities_data_frame$Distance[activities_data_frame$Distance > 0])
  distance_mean <- mean(activities_data_frame$Distance[activities_data_frame$Distance > 0])
  
  ## Simple histogram with line indicating where the median is
  distance_hist <- ggplot(activities_data_frame[which(activities_data_frame$Distance>0),], aes(x = Distance)) +
    geom_histogram() +
    ggtitle("Daily Distance with Median") +
    labs(x = "Distance (miles)", y = "Days") +
    theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=12)) +
    theme(plot.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=14, hjust=0.5)) +
    geom_vline(xintercept = distance_median, color="blue")
  ggsave(filename = "../data_visualization/distance_histogram.png", plot = distance_hist)
  
  ## Boxplot of distance (in miles) per month
  distance_montly_boxplot <- ggplot(aes(y = Distance, x = factor(months(Date), levels = month.name)), data = activities_data_frame[which(activities_data_frame$Distance>0),]) + 
    geom_boxplot() +
    ggtitle("Monthly Distance") +
    labs(x = "Month", y = "Distance (miles)") +
    theme(axis.text.x = element_text(face="bold", color="#993333", size=12, angle=60, hjust=1),
          axis.text.y = element_text(face="bold", color="#993333", size=12)) +
    theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=14)) +
    theme(plot.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=16, hjust=0.5))
  ggsave(filename = "../data_visualization/distance_by_month_boxplot.png", plot = distance_montly_boxplot)
  
  ## Future Steps graphs
  #steps_hist <- ggplot(activities_data_frame[which(activities_data_frame$Steps>0),], aes(x - Steps)) + geom_histogram()
  #ggsave(filename="../data_visualization/steps_histogram.png", plot=steps_hist)
  
}