# Readme

For this project first we set our working directory to be inside the "UCI HAR Dataset" folder.

Train and Test data set is stored inside the "train" and "test" folder inside the "UCI HAR Dataset" directory.

Each of this folders contain 3 files,-  

* Subject file

* X file

* y file

##Analyis process followed in the script

* First "features.txt" file is read and used as column name while reading the X file, so that all the columns or variables have descriptive names.

* Next, y file was read and corresponding descriptive names were added to it in another column using the "activity_labels.txt"" file. y file has values from 1 to 6 corresponding to each kind of activity.

* Finally, the subject file, y file and the X file were joined using column bind (cbind), so that there are 563 columns. (561 features, 1 for subject id and 1 for activity label) This subject file has values between 1 and 30 corresponding to each subject.

*Now, from the column names the words "mean" and "std" were searched for the mean and standard deviation values. After subsetiing 86(53 mean and 33 std) type of features were choosen.

* Same process was repeated for the train dataset.

* Next, two datasets were joined to collect the data for all 30 subjects in the x_comb dataframe.

* Now, the combined dataframe is grouped by subject and activity labels. Finally using the summarise function tidy set was created containing the average of each variable(feature) for each activity and each subject.
