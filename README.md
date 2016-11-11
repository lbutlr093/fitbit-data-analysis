# fitbit-data-analysis
Project to analyze data collected from my fitbit devices over the last few years. The data includes weight, heart rate, workouts, and general daily activity

## Steps
1. Downloaded data from the "data export" section of fitbit.com
2. Run the python script "process-raw-files.py" to split the .csv into output csv files for each section
3. Load the files through table loading R script

TBD - Data analysis with R/SQL.

## Todo:
### Reading and writing
1. Create one table for each type of observation (activities, body, sleep)
2. Read each file of that obervation type and append it to the end of the appropriate table
3. Write each full table to their own csv files

### Transformations
1. Transform date string to Date
2. Transform Date to day of week for each observation (weekdays(date)) in a new column
3. add lookup tables for workout by day of week: Monday, Chest; Tuesday, Back; etc...
