#Getting and Cleaning Data Course Project
##September 19, 2019
######R Version 3.4.4 (2018-03-15) 

This repository is a submission for the Getting and Cleaning Data Course Project. It has instructions on how to run analysis on the UCI Human Activity Recognition dataset.

######Overview
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. This repo explains how all of the scripts work and how they are connected.

######Full Description of Data
[The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

######Dataset
[UCI Human Activity Recognition Using Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

######Files
-`README.md` explains how all of the scripts work and how they are connected
-`CodeBook.md` describes the variables, the data, and any transformations or work that was performed to tidy the data
-`run_analysis.R` prepares the data and completes the required 5 steps:
	1. Merges the training and the test sets to create one dataset.
	2. Extracts only the measurments on the mean and standard deviation for each measurement.
	3. Uses descriptive activity names to name the activities in the dataset.
	4. Appropriately labels the dataset with descriptive varaible names.
	5. From the dataset in step 4, creates a second, independent tidy dataset with the average of each variable for each activity and each subject.
-`FinalData.txt` is the exported final data after completing the above sequences.


