#set working directory
setwd("H:/Training/Coursera/Getting and Cleaning Data Week 4")

#load package
library(dplyr)

#check if sub-directory exist and download the file
fileName <- "Smartphones.zip"

if (!file.exists(fileName)){
  fileUrl <-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, fileName)
}

#check if folder exists and unzip the file
if (!file.exists("UCI HAR Dataset")){
  unzip(fileName)
}

#assigning data frames
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table ("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#merge the training and the test sets to create one dataset
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

#extracts only the measurements on the mean and standard deviation for each measurement
TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

#uses descriptive activity names to name the activities in the dataset
TidyData$code <- activities[TidyData$code, 2]

#appropriately labels the data set with descriptive variable names
names(TidyData)[2] = "activity"
names(TidyData) <- gsub("Acc", "Accelermeter", names(TidyData))
names(TidyData) <- gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData) <- gsub("BodyBody", "Body", names(TidyData))
names(TidyData) <- gsub("Mag", "Magnitude", names(TidyData))
names(TidyData) <- gsub("^t", "Time", names(TidyData))
names(TidyData) <- gsub("^f", "Frequency", names(TidyData))
names(TidyData) <- gsub("tBody", "TimeBody", names(TidyData))
names(TidyData) <- gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("angle", "Angle", names(TidyData))
names(TidyData) <- gsub("gravity", "Gravity", names(TidyData))

#from the dataset in step 4, create a second, independent tidy dataset with the average of each variable for each activity and each subject
FinalData <- TidyData %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)
