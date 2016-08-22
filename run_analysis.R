library(plyr)

# 1) Merging the training and test sets:

XTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
YTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
SubjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
XTest <- read.table("UCI HAR Dataset/test/X_test.txt")
YTest <- read.table("UCI HAR Dataset/test/y_test.txt")
SubjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

# 1.1) X, Y and Subject datasets:
XData <- rbind(XTrain, XTest)
YData <- rbind(YTrain, YTest)
SubjectData <- rbind(SubjectTrain, SubjectTest)

# 2) Extract only mean and standard deviation for each measurement:

features <- read.table("UCI HAR Dataset/features.txt")

# 2.1) Selecting mean() or std():
MeanSTDeviation <- grep("-(mean|std)\\(\\)", features[, 2])

# 2.2) Subsets:
XData <- XData[, MeanSTDeviation]

# 2.3) Names:
names(XData) <- features[MeanSTDeviation, 2]

# 3) Descriptive activity names:

activities <- read.table("UCI HAR Dataset/activity_labels.txt")

# 3.1) Updating values:
YData[, 1] <- activities[YData[, 1], 2]

# 3.2) Correcting column name:
names(YData) <- "Activity"

# 4) Labeling the data set with descriptive variable names:

# 4.1) Correct column name:
names(SubjectData) <- "Subject"

# 4.2) binding all the data:
AllDATA <- cbind(XData, YData, SubjectData)

# 5) Creating a second, independent tidy data set:

Averages <- ddply(AllDATA, .(Subject, Activity), function(x) colMeans(x[, 1:66]))
write.table(Averages, "UCI HAR Dataset/averages_data.txt", row.name=FALSE)