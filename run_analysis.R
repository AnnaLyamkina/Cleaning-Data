#Course project for Getting and cleaning data course
library(dplyr)
#Get column names
names <- read.csv("UCI HAR Dataset/features.txt", header = FALSE, 
                  sep = "", colClasses = c("NULL", "character"), 
                  col.names = c(" ", "names"))
#Read test data including subject and activity labels
X_test <- read.csv("UCI HAR Dataset/test/X_test.txt", sep = "",
                   header = FALSE, col.names = names$names)
subject_test <- read.csv("UCI HAR Dataset/test/subject_test.txt",
                         sep = "", header = FALSE,
                         col.names = "subject")
activity_test <- read.csv("UCI HAR Dataset/test/y_test.txt",
                          sep = "", header = FALSE, 
                          col.names = "activity")
#Merge test data with subject and activity labels

data_test <- cbind(X_test, activity_test, subject_test)

#Read train data including subject and activity labels
X_train <- read.csv("UCI HAR Dataset/train/X_train.txt", sep = "",
                   header = FALSE, col.names = names$names)
subject_train <- read.csv("UCI HAR Dataset/train/subject_train.txt",
                         sep = "", header = FALSE,
                         col.names = "subject")
activity_train <- read.csv("UCI HAR Dataset/train/y_train.txt",
                          sep = "", header = FALSE, 
                          col.names = "activity")
#Merge train data with subject and activity labels
data_train <- cbind(X_train, activity_train, subject_train)
#Merge train and test data sets
data_merged <- rbind(data_train, data_test)

#Extract measurements on mean standard deviation
data_select <- select(data_merged, contains("mean") | 
                              contains("std") |
                              contains("activity") |
                              contains("subject"))

#rename activities with descriptive names from a lookup table
activities.code <- read.csv("UCI HAR Dataset/activity_labels.txt",
                            header = FALSE, sep = "",
                            col.names = c("code", "name"))
data_select$activity <- activities.code$name[match(data_select$activity,
                                                        activities.code$code)]
#average over activities and subjects
tidy_data <- data_select %>% 
        group_by(activity, subject) %>% 
        summarise_all(mean)
#Save tidy data set
write.csv(tidy_data, "Tidy_data.txt")