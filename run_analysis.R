##packages needed for code (might need to be installed prior to running)
library(plyr)
library(dplyr)
library(reshape2)

##Read in training data from X_train.txt and test data from X_test.txt

x_train <- read.table("./train/X_train.txt", header = FALSE)

x_test <- read.table("./test/X_test.txt", header = FALSE)

##Combine train and test data
train_test <- rbind(x_train, x_test)

##Add column header descriptions from features.txt
features <- read.table("./features.txt")
train_test_headers <- features[,2]
colnames(train_test) <- train_test_headers

##Filter everything except mean and standard deviation columns using the dplyr package
##Mean definition strictly anything with "-mean()"; no meanfreq(), etc.

means_stds <- select(train_test, contains("-mean"), contains("-std"), -contains("meanFreq"))

##Combine y_train.txt and y_test.txt for activity type (numerical)
y_train <- read.table("./train/y_train.txt", header = FALSE)
y_test <- read.table("./test/y_test.txt", header = FALSE)
x_y <- rbind(y_train, y_test)
colnames(x_y) <- "Activity"

##Combine subject test files for train and test
subject_train <- read.table("./train/subject_train.txt", header = FALSE)
subject_test <- read.table("./test/subject_test.txt", header = FALSE)
subjects <- rbind(subject_train, subject_test)
colnames(subjects) <- "Subject"

##Join activity numerical data with descriptive data (activity_labels.txt)
activity_labels <- read.table("./activity_labels.txt", header = FALSE)
colnames(activity_labels) <- c("Activity", "Name")

activity_summary <- join(x_y, activity_labels)
descriptive_activity <- select(activity_summary, Name)

##add descriptive activity column and subjects column to means_stds data
##to get tiny dataset!
tidy_dataset <- cbind(subjects, descriptive_activity, means_stds)


##Code for independent dataset with avg of each variable for each activity and each subject

tidy_melt <- melt(tidy_dataset, id = c("Subject", "Name"))
tidy_dataset_2 <- dcast(tidy_melt, Subject+Name~variable, mean)
write.table(tidy_dataset_2,"Dataset_2_For_Upload.txt", row.names=FALSE)