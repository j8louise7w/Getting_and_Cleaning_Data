Getting_and_Cleaning_Data
=========================

Course Project for Getting and Cleaning Data

This scipt prepares tidy data that can be used for later analysis from data collected from the accelerometers from the Samsung Galaxy S smartphone. Here is a link to full description of the data:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

and a link to a zip file of the data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

Before running the script, please download and unzip this file to your working directory.

The following packages need to be installed on your computer prior to executing the code:
plyr
dplyr
reshape2

This script does the following to the downloaded data:

1.) Reads in training data from X_train.txt and test data from X_test.txt

2.) Combines train and test data

3.) Adds column header descriptions from features.txt

4.) Filters everything except mean and standard deviation columns using the dplyr package

5.) Combines y_train.txt and y_test.txt files, which is the numerical description for activity type noted in the training and test data

6.) Combines subject test files for train and test, which is the numerical reresentation for each test subject

7.) Joins activity numerical data with descriptive data found in activity_labels.txt, so that you are able to see what each data measurements corresponds to

8.) Adds descriptive activity column and subjects column to filtered train/test data to get tidy dataset

9.) Finally, creates second, independent dataset with the avg of each variable for each activity and each subject and writes the table into the working directory as a text file called Dataset_2_For_Upload