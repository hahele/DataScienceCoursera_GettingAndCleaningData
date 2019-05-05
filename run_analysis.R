#Import datasets (starting from UCI HAR Dataset folder)
featureNames <- read.table("features.txt")
setwd("test")
subject_test <- read.table("subject_test.txt")
X_test <- read.table("X_test.txt")
names(X_test) <- featureNames$V2
y_test <- read.table("y_test.txt")
names(y_test) <- "activity"
setwd("../train")
subject_train <- read.table("subject_train.txt")
X_train <- read.table("X_train.txt")
names(X_train) <- featureNames$V2
y_train <- read.table("y_train.txt")
names(y_train) <- "activity"
#Merge training set and test set, set names
subject <- rbind(subject_test, subject_train)
names(subject) <- "subjectID"
X <- rbind(X_test, X_train)
y <- rbind(y_test, y_train)
dataset <- cbind(subject, y, X)

#Extract measurements on the mean and standard deviation for each measurement, as well as two first cols
selectedColumns <- grep("mean()|std()|subjectID|activity", names(dataset))
dataset2 <- dataset[,selectedColumns]

#Descriptive activity names - replace numbers in column activity with descriptions
activityNames <- read.table("activity_labels.txt")
dataset2$activity <- activityNames$V2[dataset2$activity]

#Second data set with average of each variable for each activity and each subject
#using package reshape2
if (!"reshape2" %in% installed.packages()){
  install.packages("reshape2")
}
library("reshape2")
tidy <- melt(dataset2, id=c("subjectID","activity"))
tidy2 <- dcast(tidy, subjectID + activity ~ variable, mean)

#Make txt file
write.table(tidy2, "tidy.txt", row.names = FALSE)
