Backgroud:
	In this project, we need to run a R script called "run_analysis.R" 
	to process Human Activity Recognition Using Smartphones Data Set, 
	product a tidy data that combine both training and test data of 30 subjects
	with 6 different activity.  After read the included README.txt file on dataset
	each train and test data has three main files, 
	
Run Instruction:
	1. Make sure you unzip project data getdata_projectfiles_UCI HAR Dataset.zip file into your R workspace.
	2. Your R workspace should have folder "UCI HAR Dataset" contain all dataset
	3. Put run_analysis.R script file on workspace
	4. In R, >source("run_analysis.R")
	
	

Logic of run_analysis.R:
	1. First define variable called subject_column_name of both subject_train.txt and subject_test.txt.
	   It will be used by read.csv to define data's column name
	2. Use read.csv to process subject_train.txt and assign to train_subject
	3. Use read.csv to process test_train.txt and assign to test_subject
	4. Define variable called activity_column_name of both y_train.txt and y_test.txt.
	   It will be used by read.csv to define data's column name
	5. Use read.csv to process y_train.txt and assign to train_activity
	6. Use read.csv to process y_test.txt and assign to 
	7. Use read.csv to process features.txt. The file contains all measures name of X_train.txt and X_test.txt
	   data.
	8. Use read.csv to process X_train.txt and assign to train_input_data
	9. Use read.csv to process X_test.txt and assign to test_input_data
	10. Create a vector select_columns that contains on mean and standard deviationn meansures.
	11. Use select_columns to subnet train_input_data and assign to train_mean_stddev_data
	12. Use select_columns to subnet test_input_data and assign to test_mean_stddev_data
	13. Use cbind to combine train_subject, train_activity and train_mean_stddev_data
	14. Use cbind to combine test_subject, test_activity and test_mean_stddev_data
	15. Use rbind to merge both train and test data, assign to tidy_data	
	16. Write tidy_data to csv file called "tidy_human_activity_smartphone_data.csv"
	
	
	

