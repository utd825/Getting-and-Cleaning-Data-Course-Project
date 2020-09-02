#Read features and activity labels
features_list <- read.table("/Users/ut/Downloads/UCI HAR Dataset/features.txt", col.names = c("no","features"))
activity <- read.table("/Users/ut/Downloads/UCI HAR Dataset/activity_labels.txt", col.names = c("label", "activity"))

#Reading in test data and combining into one
subject_test <- read.table("/Users/ut/Downloads/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("/Users/ut/Downloads/UCI HAR Dataset/test/X_test.txt", col.names = features_list$features)
y_test <- read.table("/Users/ut/Downloads/UCI HAR Dataset/test/Y_test.txt", col.names = "label")

library(dplyr)
y_test_label <- left_join(y_test, activity, by = "label")


tidy_test <- cbind(subject_test, y_test_label, x_test)
tidy_test <- select(tidy_test, -label)

#Reading in train data and combining into one
subject_train <- read.table("/Users/ut/Downloads/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("/Users/ut/Downloads/UCI HAR Dataset/train/X_train.txt", col.names = features_list$features)
y_train <- read.table("/Users/ut/Downloads/UCI HAR Dataset/train/Y_train.txt", col.names = "label")
y_train_label <- left_join(y_train, activity, by = "label")

tidy_train <- cbind(subject_train, y_train_label, x_train)
tidy_train <- select(tidy_train, -label)

#Combining test and train datasets
tidy_set <- rbind(tidy_test, tidy_train)

#Generate mean and standard deviation
tidy_mean_std <- select(tidy_set, contains("mean"), contains("std"))

#Generate average of all variable by respective subject and activity
tidy_mean_std$subject <- as.factor(tidy_set$subject)
tidy_mean_std$activity <- as.factor(tidy_set$activity)

tidy_avg <- tidy_mean_std %>%
  group_by(subject, activity) %>%
  summarize_each(funs(mean))