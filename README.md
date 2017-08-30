# coursera_datascience_getting_and_cleaning_data_project
This is the course project for Getting and Cleaning Data Coursera course.


The R script, `run_analysis.R`, does the following:
1. Download the dataset if it does not already exist in the working directory

2. Load the activity and feature info

3. Extract only the data on mean and standard deviation from features

4. Loads both the training and test datasets
5. Merge train and test datasets to combi

6. Convert subject and activity of combi to factors

7. Average of each variable for each activity and each subject

8. Writing combi.melt1 to the file `tidy.text`.


