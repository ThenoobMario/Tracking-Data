## Loading necessary libraries
library(dplyr)


## Getting required Data
file_name <- "UCI_HAR_Dataet.zip"

if(!file.exists(file_name)){
    file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(file_url, file_name)
}

if(!file.exists("UCI HAR Dataset")){
    unzip(file_name)
}


## Setting the Working Directory
setwd("./UCI HAR Dataset")


## Reading the Data into R
features <- read.table("features.txt", col.names = c("n", "name"))
activity_labels <- read.table("activity_labels.txt", col.names = c("code", "activity"))

# Train Data
subject_train <- read.table("./train/subject_train.txt", col.names = "subject")
x_train <- read.table("./train/X_train.txt", col.names = features$name)
y_train <- read.table("./train/y_train.txt", col.names = "code")

# Test Data
subject_test <- read.table("./test/subject_test.txt", col.names = "subject")
x_test <- read.table("./test/X_test.txt", col.names = features$name)
y_test <- read.table("./test/y_test.txt", col.names = "code")