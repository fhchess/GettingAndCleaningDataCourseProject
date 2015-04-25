library(dplyr)

# Setting the working directory with the data unconpressed
setwd("C:/Users/Frank/Desktop/Coursera Classes/Getting and Cleaning Data/UCI HAR Dataset")

##Step 1 Merges the training and the test sets to create one data set.
# Read in test set
xTest <- read.table("test/X_test.txt", header=FALSE)
yTest <- read.table("test/y_test.txt", header=FALSE)
subjectTest <- read.table("test/subject_test.txt", header=FALSE)

# Read in train set
xTrain <- read.table("train/X_train.txt", header=FALSE)
yTrain <- read.table("train/y_train.txt", header=FALSE)
subjectTrain <- read.table("train/subject_train.txt", header=FALSE)

# Reading in Variable Label Names (Features.txt)
LabelNames <- read.table("features.txt", head=FALSE)

# Combining the like data frames together
DFMain <- rbind(xTest, xTrain)
DFLabels <- rbind(yTest, yTrain)
DFSubject <- rbind(subjectTest, subjectTrain)

# Renaming the columns in the data frames to their correct labels
names(DFLabels) <- c("Activity")
names(DFSubject) <- c("Subject")
names(DFMain) <- LabelNames$V2

# Merging all the pieces to create the raw large data frame
DFFinal <- cbind(DFMain, DFSubject, DFLabels)

##Step 2 Extracts only the measurements on the mean and standard deviation for each measurement. 

# find the column names with mean or std in them
MeanSDExtract <- grep("mean\\(\\)|std\\(\\).*", names(DFFinal), ignore.case=TRUE)
# add in activity and subject columns to this extract
MeanSDExtract <- c(MeanSDExtract, 562,563)

DFFinalExtract <- DFFinal[,MeanSDExtract]

##Step 3 Uses descriptive activity names to name the activities in the data set
# Reads in the activity labels
ActivityLabel <- read.table("activity_labels.txt", header=FALSE)

# Matches the activity number with the correct activity label and puts it into a new column called "ActivityLabels"
DFFinalExtract <- merge(DFFinalExtract, ActivityLabel, by.x="Activity", by.y="V1")
names(DFFinalExtract)[names(DFFinalExtract) == "V2"] <- "ActivityLabels"

##Step 4 Appropriately labels the data set with descriptive variable names.
# Pattern matches the abbreviations in the variable names and makes them more human readable
names(DFFinalExtract) <- gsub("^t", "Time", names(DFFinalExtract))
names(DFFinalExtract) <- gsub("Acc", "Accelerometer", names(DFFinalExtract))
names(DFFinalExtract) <- gsub("Gyro", "Gyroscope", names(DFFinalExtract))
names(DFFinalExtract) <- gsub("Mag", "Magnitude", names(DFFinalExtract))
names(DFFinalExtract) <- gsub("^f", "Frequency", names(DFFinalExtract))
names(DFFinalExtract) <- gsub("BodyBody", "Body", names(DFFinalExtract))


##Step 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Subsets the data by subject and ActivityLabels and applies the mean function to those subsets
newTidyData <- aggregate(.~Subject + ActivityLabels, DFFinalExtract, FUN = mean)
newTidyData <- newTidyData[order(newTidyData$Subject, newTidyData$ActivityLabels),]
newTidyData <- subset(newTidyData, select=-c(Activity))

# Creating the new tidy data set
write.table(newTidyData, file = "newTidyData.txt", row.name=FALSE)
