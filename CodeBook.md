#Code Book 
##Table of Contents
1. `FinalData` Description
2. `run_analysis.R`
3. References

##`FinalData` Description

######Identifiers
-activity
	-the type (6) of activity performed when the corresponding measurements were taken (factor type)
-subject
	-the ID of the test subject numbered sequentially from 1 to 30 (integer type)

######Activity
-WALKING 
-WALKING_UPSTAIRS 
-WALKING_DOWNSTAIRS 
-SITTING
-STANDING 
-LAYING 

######Measurement (numeric type)
- TimeBodyAccelerometer.mean...X                  
- TimeBodyAccelerometer.mean...Y                
- TimeBodyAccelerometer.mean...Z               
- TimeGravityAccelerometer.mean...X               
- TimeGravityAccelerometer.mean...Y            
- TimeGravityAccelerometer.mean...Z             
- TimeBodyAccelerometerJerk.mean...X              
- TimeBodyAccelerometerJerk.mean...Y             
- TimeBodyAccelerometerJerk.mean...Z               
- TimeBodyGyroscope.mean ...X                        
- TimeBodyGyroscope.mean...Y                       
- TimeBodyGyroscope.mean...Z                    
- TimeBodyGyroscopeJerk.mean...X                 
- TimeBodyGyroscopeJerk.mean...Y                  
- TimeBodyGyroscopeJerk.mean...Z                
- TimeBodyAccelerometerMagnitude.mean..             
- TimeGravityAccelerometerMagnitude.mean..          
- TimeBodyAccelerometerJerkMagnitude.mean..         
- TimeBodyGyroscopeMagnitude.mean..               
- TimeBodyGyroscopeJerkMagnitude.mean..              
- FrequencyBodyAccelerometer.mean...X               
- FrequencyBodyAccelerometer.mean...Y               
- FrequencyBodyAccelerometer.mean...Z              
- FrequencyBodyAccelerometer.meanFreq...X            
- FrequencyBodyAccelerometer.meanFreq...Y          
- FrequencyBodyAccelerometer.meanFreq...Z           
- FrequencyBodyAccelerometerJerk.mean...X           
- FrequencyBodyAccelerometerJerk.mean...Y            
- FrequencyBodyAccelerometerJerk.mean...Z          
- FrequencyBodyAccelerometerJerk.meanFreq...X        
- FrequencyBodyAccelerometerJerk.meanFreq...Y       
- FrequencyBodyAccelerometerJerk.meanFreq...Z       
- FrequencyBodyGyroscope.mean...X                    
- FrequencyBodyGyroscope.mean...Y                   
- FrequencyBodyGyroscope.mean...Z                    
- FrequencyBodyGyroscope.meanFreq...X                
- FrequencyBodyGyroscope.meanFreq...Y              
- FrequencyBodyGyroscope.meanFreq...Z               
- FrequencyBodyAccelerometerMagnitude.mean..        
- FrequencyBodyAccelerometerMagnitude.meanFreq..     
- FrequencyBodyAccelerometerJerkMagnitude.mean..     
- FrequencyBodyAccelerometerJerkMagnitude.meanFreq.. 
- FrequencyBodyGyroscopeMagnitude.mean..             
- FrequencyBodyGyroscopeMagnitude.meanFreq..         
- FrequencyBodyGyroscopeJerkMagnitude.mean..         
- FrequencyBodyGyroscopeJerkMagnitude.meanFreq..     
- Angle.TimeBodyAccelerometerMean.Gravity.           
- Angle.TimeBodyAccelerometerJerkMean..GravityMean.  
- Angle.TimeBodyGyroscopeMean.GravityMean.           
- Angle.TimeBodyGyroscopeJerkMean.GravityMean.       
- Angle.X.GravityMean.                              
- Angle.Y.GravityMean.                               
- Angle.Z.GravityMean.                               
- TimeBodyAccelerometer.std...X                      
- TimeBodyAccelerometer.std...Y                     
- TimeBodyAccelerometer.std...Z                      
- TimeGravityAccelerometer.std...X                   
- TimeGravityAccelerometer.std...Y                   
- TimeGravityAccelerometer.std...Z                   
- TimeBodyAccelerometerJerk.std...X                  
- TimeBodyAccelerometerJerk.std...Y                  
- TimeBodyAccelerometerJerk.std...Z                  
- TimeBodyGyroscope.std...X                         
- TimeBodyGyroscope.std...Y                         
- TimeBodyGyroscope.std...Z                          
- TimeBodyGyroscopeJerk.std...X                     
- TimeBodyGyroscopeJerk.std...Y                     
- TimeBodyGyroscopeJerk.std...Z                      
- TimeBodyAccelerometerMagnitude.std..               
- TimeGravityAccelerometerMagnitude.std..            
- TimeBodyAccelerometerJerkMagnitude.std..          
- TimeBodyGyroscopeMagnitude.std..                   
- TimeBodyGyroscopeJerkMagnitude.std..               
- FrequencyBodyAccelerometer.std...X                  
- FrequencyBodyAccelerometer.std...Y                 
- FrequencyBodyAccelerometer.std...Z                 
- FrequencyBodyAccelerometerJerk.std...X             
- FrequencyBodyAccelerometerJerk.std...Y             
- FrequencyBodyAccelerometerJerk.std...Z            
- FrequencyBodyGyroscope.std...X                     
- FrequencyBodyGyroscope.std...Y                    
- FrequencyBodyGyroscope.std...Z                   
- FrequencyBodyAccelerometerMagnitude.std..         
- FrequencyBodyAccelerometerJerkMagnitude.std..      
- FrequencyBodyGyroscopeMagnitude.std..              
- FrequencyBodyGyroscopeJerkMagnitude.std 

##`run_analysis.R`

The `run_analysis.R` script performs the data preparation and then followed by the 5 steps required as described in the course project's definition.

1. **Download the dataset**
	-Dataset downloaded and extracted under the folder called `UCI HAR Dataset`

2. **Assign each data to variables
-`features <- features.txt` : 561 rows, 2 columns
	*The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.*
-`activities <- activity_labels.txt` : 6 rows, 2 columns 
	*List of activities performed when the corresponding measurements were taken and its codes (labels)*
-`subject_test <- test/subject_test.txt` : 2947 rows, 1 column 
	*contains test data of 9/30 volunteer test subjects being observed*
-`x_test <- test/X_test.txt` : 2947 rows, 561 columns 
	*contains recorded features test data*
-`y_test <- test/y_test.txt` : 2947 rows, 1 columns 
	*contains test data of activities’code labels*
-`subject_train <- test/subject_train.txt` : 7352 rows, 1 column 
	*contains train data of 21/30 volunteer subjects being observed*
-`x_train <- test/X_train.txt` : 7352 rows, 561 columns 
	*contains recorded features train data*
-`y_train <- test/y_train.txt` : 7352 rows, 1 columns 
	*contains train data of activities’code labels*

3. **Merges the training and the test sets to create one dataset**
-`X` : (10299 rows, 561 columns)
	*created by merging `x_train` and `x_test` using **rbind()** function*
-`Y` : (10299 rows, 1 column) 
	*created by merging `y_train` and `y_test` using **rbind()** function*
-`Subject` : (10299 rows, 1 column) 
	*created by merging `subject_train` and `subject_test` using **rbind()** function*
-`Merged_Data` : (10299 rows, 563 column) 
	*created by merging `Subject`, `Y` and `X` using **cbind()** function*


4. **Extracts only the measurements on the mean and standard deviation for each measurement** 
-`TidyData` : (10299 rows, 88 columns)
	*created by subsetting `Merged_Data`, selecting only columns: `subject`, `code` and the measurements on the `mean` and standard deviation (`std`) for each measurement*

5. **Uses descriptive activity names to name the activities in the dataset** 
-Entire numbers in `code` column of the `TidyData` replaced with corresponding activity taken from second column of the `activities` variable

6. **Appropriately labels the data set with descriptive variable names**
-`code` column in `TidyData` renamed into `activities`
-All `Acc` in column’s name replaced by `Accelerometer`
-All `Gyro` in column’s name replaced by `Gyroscope`
-All `BodyBody` in column’s name replaced by `Body`
-All `Mag` in column’s name replaced by `Magnitude`
-All start with character `f` in column’s name replaced by `Frequency`
-All start with character `t` in column’s name replaced by `Time`

7. **From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject**
-`FinalData` : (180 rows, 88 columns) 
	*created by sumarizing `TidyData` taking the means of each variable for each activity and each subject, after groupped by subject and activity*
-Export `FinalData` into `FinalData.txt` file

##References

Use of this dataset in publications must be acknowledged by referencing the following publication [1]

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.