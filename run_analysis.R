library(plyr)
library(dplyr)
X_test <- read.table("./getdata-007/UCI HAR Dataset/test/X_test.txt", sep="")
X_train <- read.table("./getdata-007/UCI HAR Dataset/train/X_train.txt", sep="")

X_colnames <- read.table("./getdata-007/UCI HAR Dataset/features.txt", sep="")
X_colnames <- select(X_colnames, V2)
X_colnames <- t(X_colnames)

colnames(X_test) <- X_colnames
colnames(X_train) <- X_colnames

y_test <- read.table("./getdata-007/UCI HAR Dataset/test/y_test.txt", sep="")
y_train <- read.table("./getdata-007/UCI HAR Dataset/train/y_train.txt", sep="")
colnames(y_test) <- "Activities"
colnames(y_train) <- "Activities"

y_test[y_test == 1] <- "WALKING"
y_test[y_test == 2] <- "WALKING_UPSTAIRS"
y_test[y_test == 3] <- "WALKING_DOWNSTAIRS"
y_test[y_test == 4] <- "SITTING"
y_test[y_test == 5] <- "STANDING"
y_test[y_test == 6] <- "LAYING"

y_train[y_train == 1] <- "WALKING"
y_train[y_train == 2] <- "WALKING_UPSTAIRS"
y_train[y_train == 3] <- "WALKING_DOWNSTAIRS"
y_train[y_train == 4] <- "SITTING"
y_train[y_train == 5] <- "STANDING"
y_train[y_train == 6] <- "LAYING"

X_test <- cbind(y_test, X_test)
X_train <- cbind(y_train, X_train)

subject_test <- read.table("./getdata-007/UCI HAR Dataset/test/subject_test.txt", sep="")
subject_train <- read.table("./getdata-007/UCI HAR Dataset/train/subject_train.txt", sep="")
colnames(subject_test) <- "Subject"
colnames(subject_train) <- "Subject"

X_test <- cbind(subject_test, X_test)
X_train <- cbind(subject_train, X_train)
merged <- rbind(X_test, X_train)
subset_mean <- merged[, grep("mean", colnames(merged))]
subset_std <- merged[, grep("std", colnames(merged))]
subset <- cbind(merged[, 1:2], subset_mean, subset_std)

averaged <- ddply(subset, .(Activities, Subject), numcolwise(mean))
write.table(averaged, "./getdata-007/tidy.txt", row.name=FALSE)
