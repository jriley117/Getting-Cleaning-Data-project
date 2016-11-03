# Code Book

This code book describes the data and variables used in this project, including the processing and transformations required to create the resulting tidy data set.

### Overview

30 volunteers (between the ages of 19-48 years) performed 6 different activities while wearing a smartphone (Samsung Galaxy S II) on their waist. The smartphone captured various data about their movements. The dataset has been randomly paritioned into training data (70% of volunteers) and test data (30% of volunteers).

### Data Source
* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original, full description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Explanation of the data files used

The dataset includes the following files:

* `features.txt`: Names of the 561 features.
* `activity_labels.txt`: Activity names and IDs for each of the 6 activities.

* `X_train.txt`: The training set with the observations of the 561 features for 21 of the 30 volunteers.
* `subject_train.txt`: Each row holds the ID of the volunteer related to each of the observations in the training set (`X_train.txt`).
* `y_train.txt`: The training labels; the ID of the activity related to each of the observations in the training set (`X_train.txt`).

* `X_test.txt`: The test set with the observations of the 561 features for 9 of the 30 volunteers.
* `subject_test.txt`: Each row holds the ID of the volunteer related to each of the observations in the test set (`X_test.txt`).
* `y_test.txt`: The test labels; the ID of the activity related to each of the observations in the test set (`X_test.txt`).

More information about the files is available in `README.txt`.

### Data files that were not used

* `features_info.txt`: Shows information about the variables used on the feature vector.
* `Inertial Signals` folder: Holds the raw signal data from the smartphone's sensor.


### Processing steps
High level processing & transformation steps implemented by the script ``run_analysis.R``:

1. All relevant data files were read into data frames, column headers were added (`ActivityID`, `ActivityLabel` and `subjectID`), and the training & test sets were merged to create a single dataset.
2. All feature columns that did not contain the string "`mean()`" or "`std()`" were removed.
3. Descriptive labels/names were added to the activity column to describe the activities.
4. A separate, independent tidy data set was created containing the mean of each feature for each subject and each activity (meaning one row for each activity, and each row contains the mean value for each of the features for that subject/activity) 
5. The output was a tidy data set written to a CSV file.


