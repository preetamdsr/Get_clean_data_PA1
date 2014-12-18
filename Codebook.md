#Codebook

For this project first we set our working directory to be inside the "UCI HAR Dataset" folder.

##Experimental design

The experiments have been carried out on a group of 30 subjects. Each **"subject"** performed six **activities** (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone. Using its embedded accelerometer and gyroscope, various associated **features** has been recorded. The obtained dataset has been randomly partitioned into two sets, where 70% of the subjects was selected for generating the training data and 30% the test data.

##Raw data

Train and Test data set is stored inside the "train" and "test" folder inside the "UCI HAR Dataset" directory.

Each of this folders contain 3 files,-  

* Subject file

* X file

* y file

The X file has 561 columns, it contains the data for all the features for the subjects in the test dataset. Feature names starting with "t" correspond to time domain signals and feature names starting with "f" denote frequency domain variables. A set of variables were estimated from these signals.

The y file has same number of rows as in X file. It contains corresponding activity of the file for the dataset. 

Finally, the subject file contains corresponding subject number for the dataset.


Similarly, there are 3 files in the train dataset for the subjects in the train group.

Name of the 561 features recorded for this study is stored in the "features.txt" file in the "UCI HAR Dataset" folder.  Also, the name of the activities and corresponding number in the y file is stored in the "activity_labels.txt" file.

##Processing of the data

* First "features.txt" file is read and used as column name while reading the X file, so that all the columns or variables have descriptive names.

* Next, y file was read and corresponding descriptive names were added to it in another column using the "activity_labels.txt"" file. y file has values from 1 to 6 corresponding to each kind of activity.

* Finally, the subject file, y file and the X file were joined using column bind (cbind), so that there are 563 columns. (561 features, 1 for subject id and 1 for activity label) This subject file has values between 1 and 30 corresponding to each subject.

*Now, from the column names the words "mean" and "std" were searched for the mean and standard deviation values. After subsetiing 86(53 mean and 33 std) type of features were choosen.

* Same process was repeated for the train dataset.

* Next, two datasets were joined to collect the data for all 30 subjects in the x_comb dataframe.

* Now, the combined dataframe is grouped by subject and activity labels. Finally using the summarise function tidy set was created containing the average of each variable(feature) for each activity and each subject.

##Tidy data

This tidy data set has 180 (6 activity per subject;total 30 subjets) observations and 88 (86 features, 1 column for subject id and 1 column for the activity label) variables.
