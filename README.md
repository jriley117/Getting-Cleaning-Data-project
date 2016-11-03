# Getting and Cleaning Data Project

## Course Project
The course project for "Getting and Cleaning Data" was to load the ["Human Activity Recognition Using Smartphones" dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and output a new, tidy dataset. The assignment was as follows:

You should create one R script called `run_analysis.R` that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to perform before running the R script:

1. Download the data zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the file.
3. Move the ```run_analysis.R``` script into the ```UCI HAR Dataset``` folder, then 
4. Set this folder as your working directory using the ```setwd()``` function in RStudio.
5. Install the `data.table` package from CRAN
6. Source the script in R ```source("run_analysis.R")```
7. The script will generate a new file ```tiny_data.csv``` in your working directory.

