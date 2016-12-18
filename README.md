# fitbit-data-analysis
Project to analyze data collected from my fitbit devices over the last few years. The data includes weight, heart rate, workouts, and general daily activity

## Steps
1. Downloaded data from the "data export" section of fitbit.com
2. Run the python script "process_raw_files.py" to split the .csv into output csv files for each section
3. Clean the files and group them by type (activities, measurements, etc...)
4. Load the files through table loading R script
5. Create visualizations of the data based on metrics listed below


## Life cycle of project

| Step             | Current phase                           | Future state                                              |
| :----------------|:----------------------------------------|:----------------------------------------------------------|
| Data Acquisition | manually downloaded from fitbit         | Curl/PHP or another method to automate obtaining data     |
| Preparation      | Python script to split by section       |                                                           |
| Cleaning		   | data_cleanse.R to clean                 |                                                           |
| Visualization    | data_visuals.R in progress              | visuals to prepare listed below                           |
| Conclusions      |                                         |                                                           |


## TODO
-Getting daily average temp
+Add day of the week
-Change the 'with open' section of python code: see stack overflow link

-Include some way to get the data from fitbit
-Write script to run (all) python and R scripts

-R script fixes
	-Issue with running the R script with the final files already in the directory - skip them in the loop that greps for 'activity' and 'body'
	-If there are no files in the directory, or minimal files, the all_fitbit_xyz.csv file will be overwritten with only the current data - all previous data will be erased. Create a shell script ASAP to avoid!
	-Do something about the 5 warning messages that appear: 
		In `[<-.factor`(`*tmp*`, ri, value = c(0L, 70L, 251L, 201L, 195L,  :	invalid factor level, NA generated


Analysis/Graphical representation:
	-Skittles post for inspiration
	-graph by day of the week
	-steps by DOW
	-exercise time by DOW
	-exercise calories/hour by DOW
	-frequently skipped exercise day of the week
-graph general trends
	-trend of steps and rough weather patterns (avg temp per week)
