
## Variables

 This data set consists of several downloaded data files, including "X_train.txt", "X_test.txt", "y_train.txt", "y_train.txt", "subject_train.txt", "subject_test.txt", "activity_labels.txt", "features.txt", "features_info.txt".
 The "X_train.txt" and "X_test.txt" are training set and test set observations.
 The "y_train.txt" and "y_train.txt" are training set and test set labels.
 The "subject_train.txt" and "subject_test.txt" identify the subject who performed the activity for each window sample. Its range is from 1 to 30.
 The "features.txt" is the list of variable names for "X_train.txt" and "X_test.txt".
 The "features_info.txt" contains information about the "features.txt".
 
## Data

 * The "X_train.txt" and "X_test.txt" were combined to form the main data set, each row is an observation. Variable names in the "features.txt" was then added to this dataframe.
 * The "y_train.txt" and "y_train.txt" were combined to be a single dataframe. "Activity" was added as the column name of this dataframe. 
 * The "subject_train.txt" and "subject_test.txt" to be a single dataframe. "Subject" was added as the column name of this dataframe. 
 * Then the three dataframe above were merged to be a complete data set.
 * Measurements on the mean and standard deviation for each measurement were extracted.
 * Acvtivity labels were replaced by the names of activity which were provided in the "activity_labels.txt".
 * Names of variables were corrected/replaced with descriptive variable names.
 * Observations were splited into subsets by Activity and Subject. Means of each Activity and each Subject were calculated.