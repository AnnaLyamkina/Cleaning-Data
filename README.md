# Cleaning-Data
Course project for Getting and Cleaning Data course

The script run_analysis.R works as follows:

1 reads in variable names from features.txt included into the data package

2 reads in test data from X_test.txt naming feature columns with variables from previous step. Appends information about activities and subjects from subject_test.txt and y_test.txt

3 repeats previous step for train data

4 merges test and train data

5 extracts only the measurements on the mean and standard deviation for each measurement (keeping activity and subject labels)

6 reads in activity code from activity_labels.txt and uses descriptive activity names to name the activities in the data set

7 groups data by activity and subjects and averages each variable

8 writes a file Tidy_data.txt
