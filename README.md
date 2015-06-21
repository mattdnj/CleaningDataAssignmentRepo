# CleaningDataAssignmentRepo
This repo is being used to submit my code for the getting and cleaning data project assignment. It includes a readme, code book and the code. 

The code in the run_analysis.R aggregates the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. This data looks at tests done on 30 subjects looking at different measures for several different activities.

From this, the data is cleaned to only leave the variables measures for mean and standard deviation. From here the data is transformed into tidy data. This data has only one measurement per row with the measure as the average of the mean or standard deviation of each measurement. It includes 4 columns, the subject, activity, variable and mean.   
