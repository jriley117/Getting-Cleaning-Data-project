## Create one R script called run_analysis.R that does the following:
    ##1.Merges the training & the test sets to create one data set.
    ##2.Extracts only the measurements on the mean & standard deviation for each measurement.
    ##3.Uses descriptive activity names to name the activities in the data set
    ##4.Appropriately labels the data set with descriptive activity names.
    ##5.From #4, creates a 2nd, independent tidy data set w/ the average of each variable for each activity & each subject.

library(data.table)

## 1) Merge the training & test set (Y=activity, X=features)

#load activity labels & features (column names)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

#read Test data (x,y,subject test)
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
# name the Test columns as features
names(x_test) <- features

#read Training data (x,y,subject train)
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
# name the Train columns as features
names(x_train) <- features


## 2) Extract only the measurements on the mean and standard deviation for each measurement.
extractMeasures <- grepl("mean|std", features)

# extract only mean & std dev measurements for Test
x_test <- x_test[,extractMeasures]
# extract only mean & std dev measurements for Train
x_train <- x_train[,extractMeasures]


## 3-4) Load activity labels & name activities for Y (test&train)

# append activity labels as a new column in y_test
y_test[,2] <- activity_labels[y_test[,1]]
names(y_test) <- c("ActivityID", "ActivityLabel")
names(subject_test) <- "subjectID"

# append activity labels as a new column in y_train
y_train[,2] <- activity_labels[y_train[,1]]
names(y_train) <- c("ActivityID", "ActivityLabel")
names(subject_train) <- "subjectID"

# Bind test & train data columns (adds subjectID, ActivityID, Activitylabel to the columns)
test_data <- cbind(data.table(subject_test), y_test, x_test)
train_data <- cbind(data.table(subject_train), y_train, x_train)

# Merge test & train data
mergeData <- rbind(test_data, train_data)
measurelabels <- intersect(names(x_test),names(x_train))

# melt the merged dataset so there’s one row for every measure
meltData <- melt(mergeData,id = c("subjectID","ActivityID","ActivityLabel"),measure.vars=measurelabels)


## 5) Find the average of each variable for each activity & each subject
# create Tidy dataset; use dcast() function to apply mean() to dataset
# subjectID & Activity broken down by the averaged variables
tidyData <- dcast(meltData, subject+ActivityLabel ~ variable, mean)

write.csv(tidyData, file="./tidy_data.csv", row.names=FALSE)
