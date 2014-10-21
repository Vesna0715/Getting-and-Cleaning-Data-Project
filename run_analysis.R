X_test <- read.table("~/UCI HAR Dataset/test/X_test.txt", quote="\"")
X_train <- read.table("~/UCI HAR Dataset/train/X_train.txt", quote="\"")
X_data<-rbind(X_test, X_train)
subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt", quote="\"")
subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt", quote="\"")
subject<-rbind(subject_test,subject_train)
y_test <- read.table("~/UCI HAR Dataset/test/y_test.txt", quote="\"")
y_train <- read.table("~/UCI HAR Dataset/train/y_train.txt", quote="\"")
activity<-rbind(y_test,y_train)
Data<-cbind(X_data,subject,activity)
#Merges the training and the test sets to create one data set.

features <- read.table("~/UCI HAR Dataset/features.txt", quote="\"")
cname<-unlist(as.character(features$V2))
x<-c("subject","activity")
clname<-c(cname,x)
colnames(Data)<-clname
x<-grep("mean",features$V2)
y<-grep("std",features$V2)
id<-c(x,y,562,563)
extract<-Data[,id]
#Extracts only the measurements on the mean and standard deviation for each measurement. 

extract$activity<-sub("1","WALKING",extract$activity)
extract$activity<-sub("2","WALKING_UPSTAIRS",extract$activity)
extract$activity<-sub("3","WALKING_DOWNSTAIRS",extract$activity)
extract$activity<-sub("4","SITTING",extract$activity)
extract$activity<-sub("5","STANDING",extract$activity)
extract$activity<-sub("6","LAYING",extract$activity)
#Uses descriptive activity names to name the activities in the data set

Name<-names(extract)
Name<-gsub("-"," ",Name)
Name<-sub(pattern="\\()", replacement="", Name)
colnames(extract)<-Name
#Appropriately labels the data set with descriptive variable names. 

library(dplyr)
grouped<-group_by(extract, subject, activity)
gdata<-grouped %>% summarise_each(funs(mean))
write.table(gdata,file="Grouped mean.txt",row.names=FALSE,col.names=TRUE)
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
