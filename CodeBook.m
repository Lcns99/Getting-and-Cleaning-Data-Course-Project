Course Project for Gettting & Celaning Data based on Human Activity Recognition Using Smartphones Dataset

This CodeBook that describes the variables, the data, and any transformations or work that was performed to clean up the source data to create a tidy dataset as per requirements of course project.

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The Original Data source:

Data for analysis is downloaded from the below URL https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Explain variables and functions:

test_set, test_labels, test_subject, train_set, train_labels, train_subject, features, actv_labels:  read and store .txt content
all_sets, all_labels, all_subjects: join 2 data frames into one
mean_std: get lines with mean() or std()
all_datas: get together all datasets
means_all_datas: second independent tidy data set with the mean of each variable for each activity and each subject
write.table(means_all_datas, "means_all_datas.txt", row.names = FALSE) : store values of "means_all_datas" in "mean_all_datas.txt".

Main steps followed:

1.Merges the training and the test sets to create one data set. 
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set ,means_all_datas.txt with the average of each variable for each activity and each subject. The output file is called means_all_datas.txt, and uploaded to this repository.
