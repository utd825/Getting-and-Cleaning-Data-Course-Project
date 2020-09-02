# Getting-and-Cleaning-Data-Course-Project

Data Source:

The data for this project was obtained from the Coursera assignment instructions. The data set is on the Human Activity Recognition Using Smartphones. the detailed description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Analysis:

The run_analysis.R contains the scripts of the analysis.Dplyr package was loaded to run this script.

All the test data and train data were read and merged into one dataset. Each variables were named accordingly based on the features listed in the features.txt file.

Using the combined tidy dataset, the average of each variable for each activity and subject was generated. 

Finallay the tidy dataset has been converted to txt using the write.table function with the row names set to FALSE. 
