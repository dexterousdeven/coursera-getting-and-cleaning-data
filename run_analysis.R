library(dplyr)

# set working directory
setwd("C:/Users/deven.choi/Documents/coursera/")

# download and unzip file
file_name <- "getdata_projectfiles_UCI HAR Dataset.zip"
if (!file.exists(file_name)){
    URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(URL, file_name, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
    unzip(file_name) 
}

# load train data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

# load test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

# merge data sets
train <- cbind(subject_train, x_train, y_train)
test <- cbind(subject_test, x_test, y_test)
data <- rbind(train ,test)

# remove un-needed objects
rm(subject_train, x_train, y_train, subject_test, x_test, y_test, train, test)

# load labels + features
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("activity_id", "activity_label")

features <- read.table("UCI HAR Dataset/features.txt", as.is = TRUE)

# rename merged data set column names
colnames(data) <- c("Subject", features[,2], "Activity")

# keep only mean and std measurements
new_columns <- grepl("Subject|Activity|mean|std", colnames(data))
data <- data[, new_columns]

# put descriptions for activities
data$Activity <- factor(data$Activity, 
                        levels = activity_labels[, 1],
                        labels = activity_labels[, 2])

rm(new_columns, activity_labels, features)

# clean up variable names formatting
data_colnames <- colnames(data)

data_colnames <- gsub("[\\(\\)-]", "", data_colnames)
data_colnames <- gsub("^f", "frequencyDomain", data_colnames)
data_colnames <- gsub("^t", "timeDomain", data_colnames)
data_colnames <- gsub("Acc", "Accelerometer", data_colnames)
data_colnames <- gsub("Gyro", "Gyroscope", data_colnames)
data_colnames <- gsub("Mag", "Magnitude", data_colnames)
data_colnames <- gsub("Freq", "Frequency", data_colnames)
data_colnames <- gsub("mean", "Mean", data_colnames)
data_colnames <- gsub("std", "StandardDeviation", data_colnames)
data_colnames <- gsub("BodyBody", "Body", data_colnames)
data_colnames <- gsub("X", ".X", data_colnames)
data_colnames <- gsub("Y", ".Y", data_colnames)
data_colnames <- gsub("Z", ".Z", data_colnames)

colnames(data) <- data_colnames

# create new tidy set with average of each variable for each subject + activity
tidy_data <- data %>%
             group_by(Subject, Activity) %>%
             summarise_all(funs(mean))

# write new tidy data set
write.table(tidy_data, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)

rm(list=ls())
