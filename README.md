Getting-and-Cleaning-Data-Project
=================================
Human Activity Recognition Using Smartphones Dataset

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.


1.I start with merging the training and the test sets to create one data set called "Data",it has 563 variables and 10299 observations.

2.Extracts only the measurements on the mean and standard deviation for each measurement.I read "features.txt" file, find out the ID of the characters which contains the keywords "mean" or "std".I give dataset "Data" the column names,then use the ID filter the columns I want,then name the subset "extract".

3.Uses descriptive activity names to name the activities in the data set.I replaced all the numbers(1-6) in column "activity" with the right activities.Make sure the table is more readable.

4.Appropriately labels the data set with descriptive variable names.I deleted all the symbols like "_"  and "()" from the column names.

5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.I grouped the dataset "extract" by "subject" and "activity".So the dataset is break into 30*6=180 groups.For each group,I calculated all the variables' mean.I call this independent tidy data set "gdata",then save it as "Grouped mean.txt".
