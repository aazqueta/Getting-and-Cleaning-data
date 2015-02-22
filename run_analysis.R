
library(gdata)
library(plyr)
library(reshape2)
library(data.table)


## -------- Reading all the data sets to see what do they have in common ----------- ##


## Test Data ## 

#Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. (According to the theory)
mydata2 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", sep=",", header=TRUE)
names(mydata2)
ncol(mydata2) ## only one column named X2
range(mydata2[,1]) ## data ranges 2-24, 2946 obwervations
str(mydata2)
summary(mydata2)
dim(mydata2)


# Test set. 
mydata3 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", sep=".", header=TRUE)
ncol(mydata3) ## 562 columns, data in groups of 17, time and frequancy domain variables, 2946 obwervations
names(mydata3) ## Strings and numeric names
dim(mydata3)

# Test labels.
mydata1 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", sep=".", header=TRUE)
ncol(mydata1) ## 1 columns
names(mydata1) ## only one column named X5, 2946 observations
range(mydata1[,1]) ## it ranges 1-6, can be the activities (walking, walk-upstairs, walk-dow, sitting, standing, laying)
dim(mydata1)

# From Internal signal folder

# The body acceleration signal obtained by subtracting the gravity from the total acceleration.
mydata4 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", sep=".", header=TRUE)
ncol(mydata4) ## 129 columns
names(mydata4) ## Strings and numeric names
dim(mydata4) ## 2946 observations

# The body acceleration signal obtained by subtracting the gravity from the total acceleration.
mydata5 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt", sep=".", header=TRUE)
ncol(mydata5) ## 129 columns
names(mydata5) ## Strings and numeric names
dim(mydata5) ## 2946 observations

# The body acceleration signal obtained by subtracting the gravity from the total acceleration.
mydata6 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt", sep=".", header=TRUE)
ncol(mydata6) ## 129 columns 
names(mydata6) ## Strings and numeric names
dim(mydata6) ## 2946 observations

# The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.
mydata7 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt", sep=".", header=TRUE)
ncol(mydata7) ##  129 columns 
names(mydata7) ## Strings and numeric names
dim(mydata7) ## 2946 observations

# The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.
mydata8 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt", sep=".", header=TRUE)
ncol(mydata8) ##  129 columns 
names(mydata8) ## Strings and numeric names
dim(mydata8) ## 2946 observations

# The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.
mydata9 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt", sep=".", header=TRUE)
ncol(mydata9) ##  129 columns 
names(mydata9) ## Strings and numeric names
dim(mydata9) ## 2946 observations

# The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128
mydata10 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", sep=".", header=TRUE)
ncol(mydata10) ##  129 columns 
names(mydata10) ## Strings and numeric names
dim(mydata10) ## 2946 observations

# The acceleration signal from the smartphone accelerometer y axis in standard gravity units 'g'. Every row shows a 128
mydata11 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt", sep=".", header=TRUE)
ncol(mydata11) ## 129 columns 
names(mydata11) ## Strings and numeric names
dim(mydata11) ## 2946 observations

# The acceleration signal from the smartphone accelerometer z axis in standard gravity units 'g'. Every row shows a 128
mydata12 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt", sep=".", header=TRUE)
ncol(mydata12) ## 129  columns 
names(mydata12) ## Strings and numeric names
dim(mydata12) ## 2946 observations



## Train Data (same number as test but with a . ) ## 

# Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
mydata.2 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", sep=",", header=TRUE)
names(mydata.2)
ncol(mydata.2) ## only one column named X1
dim(mydata.2) ## 7351 observations

# Training set. 
mydata.3 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", sep=".", header=TRUE)
ncol(mydata.3) ## 562 columns, data in groups of 17, time and frequancy domain variables
names(mydata.3) ## Strings and numeric names
dim(mydata.3) ## 7351 observations


# Training labels.
mydata.1 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", sep=".", header=TRUE)
ncol(mydata.1) ## 
range(mydata.1) ## del 1-6
names(mydata.1) ## only one column named X5
dim(mydata.1) ## 7351 observations

# From Internal signal folder

# The body acceleration signal obtained by subtracting the gravity from the total acceleration.
mydata.4 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", sep=".", header=TRUE)
ncol(mydata.4) ## 129 columns
names(mydata.4) ## Strings and numeric names
dim(mydata.4) ## 7351 observations

# The body acceleration signal obtained by subtracting the gravity from the total acceleration.
mydata.5 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt", sep=".", header=TRUE)
ncol(mydata.5) ## 129 columns
names(mydata.5) ## Strings and numeric names
dim(mydata.5) ## 7351 observations

# The body acceleration signal obtained by subtracting the gravity from the total acceleration.
mydata.6 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt", sep=".", header=TRUE)
ncol(mydata.6) ## 129 columns 
names(mydata.6) ## Strings and numeric names
dim(mydata.6) ## 7351 observations

# The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.
mydata.7 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", sep=".", header=TRUE)
ncol(mydata.7) ##  129 columns 
names(mydata.7) ## Strings and numeric names
dim(mydata.7) ## 7351 observations

# The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.
mydata.8 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt", sep=".", header=TRUE)
ncol(mydata.8) ##  129 columns 
names(mydata.8) ## Strings and numeric names
dim(mydata.8) ## 7351 observations

# The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.
mydata.9 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt", sep=".", header=TRUE)
ncol(mydata.9) ##  129 columns 
names(mydata.9) ## Strings and numeric names
dim(mydata.9) ## 7351 observations

# The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128
mydata.10 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", sep=".", header=TRUE)
ncol(mydata.10) ##  129 columns 
names(mydata.10) ## Strings and numeric names
dim(mydata.10) ## 7351 observations

# The acceleration signal from the smartphone accelerometer y axis in standard gravity units 'g'. Every row shows a 128
mydata.11 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", sep=".", header=TRUE)
ncol(mydata.11) ## 129 columns 
names(mydata.11) ## Strings and numeric names
dim(mydata.11) ## 7351 observations

# The acceleration signal from the smartphone accelerometer z axis in standard gravity units 'g'. Every row shows a 128
mydata.12 <- read.table("C:/Users/Andres/Desktop/Online_courses/Cleaning_Processing/Assigment1/UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt", sep=".", header=TRUE)
ncol(mydata.12) ## 129  columns 
names(mydata.12) ## Strings and numeric names
dim(mydata.12) ## 7351 observations


## Once we have analyze the data. It is time to merge the two relevant files: y_train & y_test

total <- rbind(mydata3, mydata.3)
dim(total)
range(total[,1])
total

# We are interested on the files containing the measured activities:
# Merge both data frames together
total_activity<-rbind(mydata1, mydata.1)

# We are interested on the files containing info about which measurements correspond to which subject:
# Therefore me need to merge 
total_subjects <- rbind(mydata2, mydata.2)

#Add header to the total Data frame, corresponding to the features
features<-read.table("features.txt")
features<-features[,2]
names(total)<-features

#Extract only measurements containing the word mean and std
total_mean<-total[,grep("mean", names(total), value=TRUE)]
total_std<-total[,grep("std", names(total), value=TRUE)]

# Merge the extracted fata frames
total_clean<-cbind(total_mean, total_std)

#Create name of the data frame(column vector) total_activity_code in order to access it easier
names(total_activity)<-"activity"

# Change numbers by string characters specifying the activity
total_activity$activity[total_activity$activity == "1"] <- "walking"
total_activity$activity[total_activity$activity== "2"] <- "walking_upstairs"
total_activity$activity[total_activity$activity == "3"] <- "walking_downstairs"
total_activity$activity[total_activity$activity == "4"] <- "Sitting"
total_activity$activity[total_activity$activity == "5"] <- "Standing"
total_activity$activity[total_activity$activity == "6"] <- "laying"

#Add the activity column to the data frame
total_clean<-cbind(total_activity,total_clean )

#Create name to the subject data frame
names(total_subjects)<-"subject"

#Add subject column to the data frame
total_clean<-cbind(total_subjects,total_clean )

# Create new data frame from previous one, with the average of the measures for each activity and each subject
new_data_set<-aggregate(. ~subject + activity, total_clean, mean)

write.table(new_data_set, file = "tidydata.txt", row.names=FALSE, sep = "\t ", eol="\n")

