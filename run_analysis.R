## Merging the tables created as required
train_merged <- cbind(subject_train, y_train, x_train)
test_merged <- cbind(subject_test, y_test, x_test)

merged_data <- rbind(train_merged, test_merged)


## Extracting the required information
req_data <- select(merged_data, subject, code, contains("mean"), contains("std"))


## Assigning descriptive activiy names 
req_data$code <- activity_labels[req_data$code, 2]


## Labeling the variables appropriately 
names(req_data)[2] <- "activity"
names(req_data) <- gsub("^t", "Time", names(req_data))
names(req_data) <- gsub("^f", "Frequency", names(req_data))
names(req_data) <- gsub("Acc", "Accelerometer", names(req_data))
names(req_data) <- gsub("Gyro", "Gyroscope", names(req_data))
names(req_data) <- gsub("Mag", "Magnitude", names(req_data))
names(req_data) <- gsub("BodyBody", "Body", names(req_data))
names(req_data) <- gsub("-mean()", "Mean", names(req_data), ignore.case = TRUE)
names(req_data) <- gsub("-std()", "STD", names(req_data), ignore.case = TRUE)
names(req_data) <- gsub("-freq()", "Frequency", names(req_data), ignore.case = TRUE)
names(req_data) <- gsub("angle", "Angle", names(req_data))
names(req_data) <- gsub("gravity", "Gravity", names(req_data))


## Creating another Dataset which contains the average of each variable for each activity and subject
final_data <- req_data %>%
      group_by(subject, activity) %>%
      summarise_all(funs(mean))

# Writing the dataset 
write.table(final_data, "final_data.txt", row.names = FALSE)