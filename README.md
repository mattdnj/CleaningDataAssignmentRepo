# CleaningDataAssignmentRepo
This repo is being used to submit my code for the getting and cleaning data project assignment. It includes a readme, code book and the code. 

The code in the run_analysis.R aggregates the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. This data looks at tests done on 30 subjects looking at different measures for several different activities.

From this, the data is cleaned to only leave the variables measures for mean and standard deviation. From here the data is transformed into tidy data. This data has only one measurement per row with the measure as the average of the mean or standard deviation of each measurement. It includes 4 columns, the subject, activity, variable and mean.   

More Detailed breakdown of code:
Overall the code creates a tidy data set for fitness band data set looking at the average of the mean and standard deviation of the variables measured.
Code reads in the data sets into vectors and tables.
It then attaches the activity names and subject number to the datasets and merges the test and train data sets together into the fitness table.
It extracts measurements of the mean and standard deviation for each variable.
The code then alters the headers from features.txt to be compatible with the subsetting functions and binds the headers to the fitness table including subject and activity.
It then subsets the columns to only include the subject, activity, mean and std for variables.
Then it replaces the activity number with a label to better describe the information like walking or laying.
The code then creates a second independent tidy data set to show the average of each variable grouped by subject, activity and the variable measured. 
