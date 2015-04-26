Getting and Cleaning Data Course Project
==========================================
This repository hosts the R code and documentation files for "Getting and Cleaning Data" Coursera course.
The dataset used in this project can be found [here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Files

The R code assumes that all the data has been uncompressed in the same folder as the working directory with none of the file names changed.
`CodeBook.md` describes the variables, data, and any work that was done to clean the data into a tidy data set.
`run_analysis.R` contains the code to perform the analysis required in the project.

### Setting the correct working directory in R
It should be noted that on line 4 of the R script is where one would set the correct working directory for the script to run properly.


## Project Instruction
The following is the set of instructions for this project:
You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
