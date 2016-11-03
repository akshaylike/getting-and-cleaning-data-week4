# Creating Tidy Dataset from UCI HAR Dataset
## Contains project from week 4 for coursera getting and cleaning data course

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The R script in this repo called run_analysis.R does the following analysis:

- Merges training & test datasets into one consolidated dataset.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the dataset created in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In this project you will find the following:

- run_analysis.R - The code for performing the above mentioned tasks on the dataset
- tidy_data.txt - The clean data extracted from original data from UCI HAR Dataset
- CODEBOOK.md - The Codebook containing references & descriptions for all the variables used in tidy_data.txt
- README.md - The analysis of the code in run_analysis.R
