 
 # Coursera Getting and Cleaning Data Project

 library(dplyr)
 library(tidyr)
 
 setwd("D:\\Coursera_GettingandCleaningDataProject\\GitHub")
 
 ### Read files into R
 # train
 X_train <- read.table("D:\\Coursera_GettingandCleaningDataProject\\train\\X_train.txt", header = FALSE, sep = "")
 y_train <- read.table("D:\\Coursera_GettingandCleaningDataProject\\train\\y_train.txt", header = FALSE, sep = "")
 subject_train <- read.table("D:\\Coursera_GettingandCleaningDataProject\\train\\subject_train.txt", header = FALSE, sep = "")
 
 # test
 X_test <- read.table("D:\\Coursera_GettingandCleaningDataProject\\test\\X_test.txt", header = FALSE, sep = "")
 y_test <- read.table("D:\\Coursera_GettingandCleaningDataProject\\test\\y_test.txt", header = FALSE, sep = "")
 subject_test <- read.table("D:\\Coursera_GettingandCleaningDataProject\\test\\subject_test.txt", header = FALSE, sep = "")
 
 # features
 features <- read.table("D:\\Coursera_GettingandCleaningDataProject\\features.txt", header = FALSE, sep = "")
 
 # activity_labels
 activity_labels <- read.table("D:\\Coursera_GettingandCleaningDataProject\\activity_labels.txt", header = FALSE, sep = "")
 
 ###########################################################################################
 ############  1. Merges the training and the test sets to create one data set. ############
 ###########################################################################################
 
 ### merge X_train and X_test, and add column names
 # project_1
 project_1 <- rbind(X_train, X_test)
 colnames(project_1) <- features$V2
 
 ### merge y_train and y_test, and add column names
 # project_2
 project_2 <- rbind(y_train, y_test)
 colnames(project_2) <- "Activity"

 ### merge subject_train and subject_test, and add column names
 project_3 <- rbind(subject_train, subject_test)
 colnames(project_3) <- "Subject"
 
 ### merge all data together
 project_DataSet <- cbind(project_1, project_2, project_3)
 
 #####################################################################################################################
 ############  2. Extracts only the measurements on the mean and standard deviation for each measurement. ############
 ##################################################################################################################### 
 
 # extract variables which contain "Mean" or "std"
 project_Mean_std <- project_DataSet[,c(grep("Mean", names(project_DataSet)), grep("std", names(project_DataSet)))]
 
 #####################################################################################################
 ############  3. Uses descriptive activity names to name the activities in the data set. ############
 ##################################################################################################### 
 
 # replace numbers with descriptive activity names
 project_DataSet$Activity <- gsub("1", "WALKING", project_DataSet$Activity)
 project_DataSet$Activity <- gsub("2", "WALKING_UPSTAIRS", project_DataSet$Activity)
 project_DataSet$Activity <- gsub("3", "WALKING_DOWNSTAIRS", project_DataSet$Activity)
 project_DataSet$Activity <- gsub("4", "SITTING", project_DataSet$Activity)
 project_DataSet$Activity <- gsub("5", "STANDING", project_DataSet$Activity)
 project_DataSet$Activity <- gsub("6", "LAYING", project_DataSet$Activity)
 project_DataSet$Activity <- gsub("6", "LAYING", project_DataSet$Activity)

 ################################################################################################
 ############  4. Appropriately labels the data set with descriptive variable names. ############
 ################################################################################################
 
 # replace short names with descriptive activity names
 names(project_DataSet) <- gsub("^t", "time", names(project_DataSet))
 names(project_DataSet) <- gsub("^f", "frequency", names(project_DataSet))
 names(project_DataSet) <- gsub("Acc", "Accelerometer", names(project_DataSet))
 names(project_DataSet) <- gsub("Gyro", "Gyroscope", names(project_DataSet))
 names(project_DataSet) <- gsub("Mag", "Magnitude", names(project_DataSet))
 names(project_DataSet) <- gsub("BodyBody", "Body", names(project_DataSet))
 
 ################################################################################################
 ##                     5. From the data set in step 4, creates a second,                      ##
 ##                   independent tidy data set with the average of each variable              ##
 ##                     for each activity and each subject.                                    ##
 ################################################################################################
 
 # split data into subsets by "Activity" and "Subject", apply mean() to each subset
 project_DataSet_tidy <- aggregate(project_DataSet[1:(length(names(project_DataSet))-2)], list(Activity=project_DataSet$Activity, Subject=project_DataSet$Subject), mean, na.rm=TRUE)

 write.table(project_DataSet_tidy, "tidy_DataSet.txt", row.names = F)
 
 # check
 #check <- read.table("D:\\Coursera_GettingandCleaningDataProject\\GitHub\\tidy_DataSet.txt", header = T, sep = "")
 #head(check[,1:10])
 #tail(check[,1:10])
 
 
 
 
 
 
 
 
 
 