## Description of R scripts to generate 4 plots
### Reading and processing the data file from UCI MLR
1. Read data as data table
2. Process data to convert Date and Time using as.Date() and hms() from lubridate
3. Subset data for Feb 1-2, 2007 and convert factors to numeric class
4. Add an Index for minutes to be used in Plot-2,3,4 and vector of column names for Plot-3,4
5. Generate plots for submission - png, 480x480
### Note:
Generating png plot causes and outer box to be created (Gray with shadow).
This box disappears when png file is magnified in Windows picture viewer or inserted into a Word doc (see sample).
Color for this outer box can be chnaged, but coul not figure out how to eliminate it completely.