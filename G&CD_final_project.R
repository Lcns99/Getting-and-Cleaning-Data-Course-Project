# download zip
#Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download(Url, "dataset.zip")
#unzip("dataset.zip")
#library(plyr)

#read test files
test_set <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#read train files
train_set <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_labels <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#read features file
features <- read.table("./UCI HAR Dataset/features.txt")
#read activity labels.txt
actv_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#Join data
all_sets <- rbind(test_set, train_set)
all_labels <- rbind(test_labels, train_labels)
all_subjects <- rbind(test_subject, train_subject)

#Get mean and std of features
mean_std <- grep("mean()|std()", features$V2) #get lines with mean or std
all_sets <- all_sets[, mean_std] #apply true statements(grep) in all_sets
names(all_sets) <- features[mean_std, 2] #names columns with features variables


#Uses descriptive activity names to name the activities in the data set
all_labels[,1] <-actv_labels[all_labels[,1], 2]
names(all_labels)<- "activity"

# Appropriately label the data set with descriptive variable names
names(all_subjects) <- "subject"

#Get together all datasets
all_datas <- cbind(all_subjects, all_labels, all_sets)

#creates a second, independent tidy data set with the average of each variable for each activity and each subject
means_all_datas <- ddply(all_datas, .(subject, activity), 
                         function(x) colMeans(x[3:81]))
write.table(means_all_datas, "means_all_datas.txt", row.names = FALSE)



