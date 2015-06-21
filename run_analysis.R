##code to create a tidy data set for fitness band data set 

##Code to read in the data sets into variables
library(data.table)

xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
stest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
strain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

##This attaches the activity names and subject to the datasets 
##and merges the test and train data sets together into the fitness variable
test <- cbind(stest,ytest,xtest)
train <- cbind(strain,ytrain, xtrain)
fitness <- rbind(test,train)

##Extracts measurements of the mean and standard deviation for each variable
##It first transposes the variables and subsets for only the variable names
##It then appends the headers 'activity' and 'subject' to the beginning of the vector
##The last line alters the headers to be compatible with the and binds them to the fitness table
measurements <- read.table("./UCI HAR Dataset/features.txt")
  meas <- t(measurements)
    meas <- meas[2,]
    meas <- append(meas, "activity",after = 0)
    meas <- append(meas, "subject",after = 0)
  colnames(fitness) <- make.names(meas)

##This subsets the columns to only include the subject, activity, mean and std for variables
library(gdata)
  
fit <- matchcols(fitness, with=c("subject","activity","mean","std"),method=("or"))
  fit <- unlist(fit)
msfit <- fitness[,fit]

##Replaces numeric label for activities to string descriptions
msfit$activity <- factor(msfit$activity)
levels(msfit$activity) <- c("walking","wlk_upstrs","wlk_dwnstrs","sitting","standing","laying")


##Creates second independent tidy data set to show the average of each variable grouped by
##subect, activity and variable
library(tidyr)

tidyfit <- gather(msfit,Variable,measurement,tBodyAcc.mean...X:fBodyBodyGyroJerkMag.std..)
tidyfit <- ddply(tidyfit,.(subject,activity,Variable), summarize, mean = mean(measurement))

write.table(tidyfit, file = "tidy_fitness_data.txt", row.names=FALSE)
