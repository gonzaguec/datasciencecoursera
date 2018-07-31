#####
##Getting and Cleaning Data Course Project
## Autor: Gonzalo Caceres
##
##The purpose of this project is to demonstrate your ability
##to collect, work with, and clean a data set. The goal is 
##to prepare tidy data that can be used for later analysis.
##You will be graded by your peers on a series of yes/no 
##questions related to the project. 
##
##You will be required to submit: 
##1) a tidy data set as described below, 
##2) a link to a Github repository with your script for 
##performing the analysis, and 
##3) a code book that describes the variables, the data,
##and any transformations or work that you performed 
##to clean up the data called CodeBook.md. You should 
##also include a README.md in the repo with your scripts. 
##This repo explains how all of the scripts work and how they are connected.
##
##
##One of the most exciting areas in all of data science 
##right now is wearable computing - see for example this 
##article . Companies like Fitbit, Nike, and Jawbone Up are
##racing to develop the most advanced algorithms to attract
##new users. The data linked to from the course website 
##represent data collected from the accelerometers from the
##Samsung Galaxy S smartphone. A full description is available
##at the site where the data was obtained:
##        
##        http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
##
##Here are the data for the project:
##        
##        https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##
##You should create one R script called run_analysis.R that does the following.
##
##
##
## First step: get files
zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR Dataset.zip"

download.file(zipUrl, zipFile, mode = "wb")

unzip(zipFile)

datafolder <- "UCI HAR Dataset"

# read training data
trainingSubjects <- read.table(file.path(datafolder, "train", "subject_train.txt"))
trainingValues <- read.table(file.path(datafolder, "train", "X_train.txt"))
trainingActivity <- read.table(file.path(datafolder, "train", "y_train.txt"))

# read test data
testSubjects <- read.table(file.path(datafolder, "test", "subject_test.txt"))
testValues <- read.table(file.path(datafolder, "test", "X_test.txt"))
testActivity <- read.table(file.path(datafolder, "test", "y_test.txt"))

# read features, don't convert text labels to factors
features <- read.table(file.path(datafolder, "features.txt"), as.is = TRUE)
## note: feature names (in features[, 2]) are not unique
##       e.g. fBodyAcc-bandsEnergy()-1,8

# read activity labels
activities <- read.table(file.path(datafolder, "activity_labels.txt"))
colnames(activities) <- c("activityId", "activityLabel")
##
##
##
## Second step: Merges the training and the test sets to create one data set.
# concatenate individual data tables to make single data table
humanActivity <- rbind(
        cbind(trainingSubjects, trainingValues, trainingActivity),
        cbind(testSubjects, testValues, testActivity)
)

# remove individual data tables to save memory
rm(trainingSubjects, trainingValues, trainingActivity, 
   testSubjects, testValues, testActivity)

# assign column names
colnames(humanActivity) <- c("subject", features[, 2], "activity")

##
##
##
## Third step: Extracts only the measurements on the mean and standard deviation for each measurement.
# determine columns of data set to keep based on column name...
columnsToKeep <- grepl("subject|activity|mean|std", colnames(humanActivity))

# ... and keep data in these columns only
humanActivity <- humanActivity[, columnsToKeep]
##
##
##
## Fourth step: Uses descriptive activity names to name the activities in the data set
# replace activity values with named factor levels
humanActivity$activity <- factor(humanActivity$activity, 
                                 levels = activities[, 1], labels = activities[, 2])
##
##
##
## Fifth step: Appropriately labels the data set with descriptive variable names
# get column names
humanActivityCols <- colnames(humanActivity)

# remove special characters
humanActivityCols <- gsub("[\\(\\)-]", "", humanActivityCols)

# expand abbreviations and clean up names
humanActivityCols <- gsub("^f", "frequencyDomain", humanActivityCols)
humanActivityCols <- gsub("^t", "timeDomain", humanActivityCols)
humanActivityCols <- gsub("Acc", "Accelerometer", humanActivityCols)
humanActivityCols <- gsub("Gyro", "Gyroscope", humanActivityCols)
humanActivityCols <- gsub("Mag", "Magnitude", humanActivityCols)
humanActivityCols <- gsub("Freq", "Frequency", humanActivityCols)
humanActivityCols <- gsub("mean", "Mean", humanActivityCols)
humanActivityCols <- gsub("std", "StandardDeviation", humanActivityCols)

# correct typo
humanActivityCols <- gsub("BodyBody", "Body", humanActivityCols)

# use new labels as column names
colnames(humanActivity) <- humanActivityCols
##
##
##
## Sixth step: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# group by subject and activity and summarise using mean
humanActivityMeans <- humanActivity %>% 
        group_by(subject, activity) %>%
        summarise_each(funs(mean))

# output to file "tidy_data.txt"
write.table(humanActivityMeans, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)