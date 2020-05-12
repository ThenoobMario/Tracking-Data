# Tracking-Data

This is a repository for the course project of Getting and Cleaning Data (Coursera). The project required to run certain analysis on the Human Activity Recognition Dataset.

## Dataset

[Human Activity Recognition Using Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Files

1. [`CodeBook.md`](https://github.com/ThenoobMario/Tracking-Data/blob/master/CodeBook.md) This enlists all the steps, variables and the transformation done in the scripts attached.

2. [`getting_data.R`](https://github.com/ThenoobMario/Tracking-Data/blob/master/getting_data.R) Gets the data from the net so that it could be applied for further operations. I made this so that you may not need to go through the hassle of getting the data yourself.

3. [`run_analysis.R`](https://github.com/ThenoobMario/Tracking-Data/blob/master/run_analysis.R) Performs the steps given in the instructions, which are as follows:
    - Merges the training and the test sets to create one data set.
    - Extracts only the measurements on the mean and standard deviation for each measurement.
    - Uses descriptive activity names to name the activities in the data set
    - Appropriately labels the data set with descriptive variable names.
    - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

4. [`final_data.txt`](https://github.com/ThenoobMario/Tracking-Data/blob/master/final_data.txt) This is the data set mentioned in the last instruction.


## List of Identifiers

Following is the list of all the variables used in the two scripts I have made.

Identifier        | Description
------------------|-----------------------------------
`file_name`       | Stores the name of the downloaded zip file
`file_url`        | Stores the url
`features`        | Reads `features.txt` into R
`activity_labels` | Reads `activiy_labels.txt` into R
`subject_train`   | Reads `train/subject_train.txt` into R
`x_train`         | Reads `train/X_train.txt` into R
`y_train`         | Reads `train/y_train.txt` into R
`subject_test`    | Reads `test/subject_test.txt` into R
`x_test`          | Reads `test/X_test.txt` into R
`y_test`          | Reads `test/y_test.txt` into R
`train_merged`    | Merges all the data related to train using **cbind()**
`test_merged`     | Merges all the data related to test using **cbind()**
`merged_data`     | Merges `train_merged` and `test_merged` using **rbind()**
`req_data`        | Using the `dplyr` function **select()** it extracts the columns as stated in the instructions
`final_data`      | Dataframe which stores the average of each variable for each activity and each subject  


## Steps to follow

1. **Download the Dataset**
    - Run `getting_data.R` to get the dataset.
    
    - It also reads data into R as mentioned in the table.
    
2. **Run `run_analysis.R`** which performs the following steps:
    - Merges the training and the test sets to create one data set.
    `merged_data` *10299 rows, 563 cols* is made by merging `train_merged` *7352 rows, 563 cols* and `test_merged` *2947 rows, 563 cols* using **rbind()**.
    
    - Extracts only the measurements on the mean and standard deviation for each measurement.
    This is done using **select()** function in `dplyr` library and is stored in `req_data` *10299 rows, 88 cols*.
    
    - Uses descriptive activity names to name the activities in the data set.
    This is done by replacing the contents of the `code` column in `req_data` with the second column of `activity_labels`.
    
    - Appropriately labels the data set with descriptive variable names.
    Here the function **gsub()** is used to get desired result.
    
    - From the data set in the step above, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    `final_data` *180 rows, 88 cols* stores the required content.
    
    - Writes `final_data`.
    
    
**NOTE: Please be careful to change the working directory before trying to source `run_analysis`.**