#set column name of subject, then read train and test subject data
subject_column_name=c("subject")
train_subject <- read.csv("UCI HAR Dataset\\train\\subject_train.txt", header=FALSE, col.names=subject_column_name)
test_subject <- read.csv("UCI HAR Dataset\\test\\subject_test.txt", header=FALSE, col.names=subject_column_name)


#set column name of activity, then read train and test activity data
train_activity_column_name=c("activity_num")
train_activity <- read.csv("UCI HAR Dataset\\train\\y_train.txt", header=FALSE, col.names=train_activity_column_name )
test_activity <- read.csv("UCI HAR Dataset\\test\\y_test.txt", header=FALSE, col.names=train_activity_column_name )


#read feature data
features <- read.csv("UCI HAR Dataset\\features.txt",header=FALSE, sep=" ")

#read train and test data, take feature data as column name
train_input_data <- read.csv("UCI HAR Dataset\\train\\X_train.txt",header=FALSE, col.name=features[,2], sep="")
test_input_data <- read.csv("UCI HAR Dataset\\test\\X_test.txt",header=FALSE, col.name=features[,2], sep="")


#select mean and stand dev columns only
select_columns=c(1:6,41:46,81:86,121:126,161:166,201:206,214:219,227:232,240:245,253:258,266:271,294:299,345:349,373:378,424:429,452:457,454:459,503:508,513:518,526:531,539:544,552,555:561)

#subset data with only mean and standard deviation columns
train_mean_stddev_data <- train_input_data[,select_columns]
test_mean_stddev_data <- test_input_data[,select_columns]


#combine train subject, activity, and measure data
train_data <- cbind(train_subject, train_activity, train_mean_stddev_data)

#combine test subject, activity, and measure data
test_data <- cbind(test_subject, test_activity, test_mean_stddev_data)

#combine train and test data
tidy_data <- rbind(train_data, test_data)

#write to csv file
write.csv(tidy_data, file="tidy_human_activity_smartphone_data.csv")

library("plyr")
#average of each measures for each activity and each subject. 
subject_activity_measure_mean <- ddply(tidy_data, .(subject,activity_num), numcolwise(mean))

#write to subject_activity_measure_mean.csv
write.csv(subject_activity_measure_mean, file="subject_activity_measure_mean.csv")




