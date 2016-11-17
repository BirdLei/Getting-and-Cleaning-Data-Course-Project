# Data Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 1. Merges the training and the test sets to create one data set.
tmp1 <- read.table("train/X_train.txt")
tmp2 <- read.table("test/X_test.txt")
X<- rbind(tmp1, tmp2)
tmp1 <- read.table("train/subject_train.txt")
tmp2 <- read.table("test/subject_test.txt")
s<- rbind(tmp1, tmp2)
tmp1 <- read.table("train/y_train.txt")
tmp2 <- read.table("test/y_test.txt")
y <- rbind(tmp1, tmp2)
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")
MandS <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, MandS]
names(X) <- features[MandS, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))
# 3. Uses descriptive activity names to name the activities in the data set.
activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
y[,1] = activities[y[,1], 2]
names(y) <- "activity"
# 4. Appropriately labels the data set with descriptive activity names.
names(s) <- "subject"
cleaned <- cbind(s, y, X)
write.table(cleaned, "merged_tidy.txt")
# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
uniqueSubjects = unique(s)[,1]
numSubjects = length(unique(s)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]
row = 1
for (ss in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[ss]
    result[row, 2] = activities[a, 2]
    tmp <- cleaned[cleaned$subject==ss & cleaned$activity==activities[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(result, "merged_tidy_with_averages.txt")