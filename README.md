# Getting and Cleaning Data

## Synopsis

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The R script called run_analysis.R should do the following:

1) Merges the training and the test sets to create one data set;
2) Extracts only the measurements on the mean and standard deviation for each measurement;
3) Uses descriptive activity names to name the activities in the data set;
4) Appropriately labels the data set with descriptive variable names;
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Code Example

The R script, run_analysis.R, does the following:

1) Merges the training and test sets;
1.1) Creates the X, Y and Subject datasets;
2) Extracts only the mean and standart deviation for each measurement;
2.1) Selects the mean() and std();
2.2) Selects the names;
3) Uses descriptive activity names to name the activities;
3.1) Updates values;
3.2) Corrects the column names;
4) Labels the data set descriptive variable names;
4.1) Corrects the columns names;
4.2) Binds all the data;
5) Creates a second, independent tidy date set.

The end result is shown in the averages_data.txt.
