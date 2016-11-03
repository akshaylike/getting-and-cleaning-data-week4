library(dplyr)

setwd("C:/Users/Ashish/Documents/getting-and-cleaning-data/UCI HAR Dataset/")
y_train <- read.table("train/y_train.txt", quote="\"")
y_test <- read.table("test/y_test.txt", quote="\"")

features <- read.table("features.txt", quote="\"")
activity_labels <- read.table("activity_labels.txt", quote="\"")

subject_train <- read.table("train/subject_train.txt", quote="\"")
subject_test <- read.table("test/subject_test.txt", quote="\"")

X_train <- read.table("train/X_train.txt", quote="\"")
X_test <- read.table("test/X_test.txt", quote="\"")


#Analyzing 70% of the volunteers for preparing the training data

colnames(activity_labels)<- c("V1","Activity")

#merging y_train and activity label

subject<- rename(subject_train, subject=V1)
train<- cbind(y_train,subject)
train1<- merge(train,activity_labels, by=("V1"))

#giving names from features to the rest of the columns in X_train dataframe
colnames(X_train)<- features[,2]

#Combining all training dataframes - y_train, activity labels, X_train
train2<- cbind(train1,X_train)

#eliminating the first column from train2 - for preventing duplicate errors
train3<- train2[,-1]

#selecting only the columns that contain mean and standard deviation
train4<- select(train3,contains("subject"), contains("Activity"), contains("mean"), contains("std"))

#Analyzing 30% of the volunteers for getting test data

colnames(activity_labels)<- c("V1","Activity")

#merging y_test with activity label
subjecta<- rename(subject_test, subject=V1)
test<- cbind(y_test,subjecta)
test1<- merge(test,activity_labels, by=("V1"))


#giving names from features to rest of the columns in X_test data frame
colnames(X_test)<- features[,2]

#Combining y_test, activity labels, X_test dataframes
test2<- cbind(test1,X_test)

#eliminating the first column from train2 to avoid duplicate error
test3<- test2[,-1]

#selecting only the columns that contain mean and standard deviation
test4<- select(test3,contains("subject"), contains("Activity"), contains("mean"), contains("std"))

# Combining Train data and Test data
run_analysis1<- rbind(train4,test4)

#Summarizing the consolidated data


run_analysis<- (run_analysis1%>%
                  group_by(subject,Activity) %>%
                  summarise_each(funs( mean)))

print(run_analysis)