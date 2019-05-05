featureNames: imports names for the measurements
subject_test: the subjects in the test data set
subject_train: the subjects in the training data set
X_test: the measurements of the test data set
X_training: the measurements of the training data set
y_test: the activities in the test data set
y_training: the activities in the training data set
subject: subjectIDs of the merged data set (both training and test data set)
X: merged measurements
y: merged activities
dataset: merged complete data set
selectedColumns: the columns containing either "mean()", "std()", "subjectID" or "activity"
dataset2: subset of dataset, only containing the columns containing either "mean()", "std()", "subjectID" or "activity"
activityNames: description of the activity, for example "WALKING"
tidy: first step to a tidy data set, using the melt function in the reshape2 package
tidy2: the final data set, comntaining average for each activity and each subject.
