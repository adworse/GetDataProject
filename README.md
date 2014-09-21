## Course Project 1

The script reads  data from /UCI HAR Dataset/test/X_test.txt and
from /UCI HAR Dataset/train/X_train.txt into two separate data frames.

After that it reads column names from UCI HAR Dataset/features.txt
and assigns the values to column names in two data frames.

After that it reads digital codes of activities from /UCI HAR Dataset/test/y_test.txt
and /UCI HAR Dataset/train/y_train.txt files.

It then assigns descriptive activity names instead of digital codes.

After that it binds resulting  activity columns with respective data frames.

Then it reads subject columns from /UCI HAR Dataset/test/subject_test.txt and
/UCI HAR Dataset/train/subject_train.txt files and binds these columns with 
data frames.


After that it binds the two data frames in one.

Then it subsets resulting data frame, so only columns with names containing
 "mean" or "std" are left.

After that it creates a second, independent tidy data set with the average 
of each variable for each activity and each subject.

After that it creates tidy.txt file with this data set.
