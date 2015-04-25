# Getting and Cleaning Data Project
------------------------------------

This is a code book that describes the variables, the data, and any transformations or work that was performed to clean up the data.
The dataset used in this project can be found [here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
Original Source: [Human Activity Recognition Using Smartphones.](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

##For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

##Description of the 5 Steps

###Step 1: Merges the training and the test sets to create one data set.
After setting the working directory and extracting / uncompressing the raw data files to the folder "UCI HAR Dataset", read into R the following files:
- subject_test.txt
- x_test.txt
- y_test.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- features.txt

After reading in the data, the column names were assigned using the labels from features.txt and then merged into one large data frame called "DFFinal".

###Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
Used the grep function to find all the column labels with mean() or std() and extracted them. Then also extracted the subject and activity columns from "DFFinal". Stored it into a new variable called "DFFinalExtract"


###Step 3: Uses descriptive activity names to name the activities in the data set
Read into R the activity_labels.txt file and used merge() to include in the activity name. This was stored in a new column called "ActivityLabels".


###Step 4: Appropriately labels the data set with descriptive activity names. 
Used gsub() to pattern match and replace the activity labels to make it more readable.


###Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Used the aggregate() function to subset the data by Subject and ActivityLabels and applies the mean function to those subsets. Then stored it into a new tidy dataframe called "newTidyData". After newTidyData is then exported to a txt file called "newTidyData.txt".