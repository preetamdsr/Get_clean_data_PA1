############## Test Case###############

#reading feature file
f<-read.table("features.txt")
#extracting descriptive names for each feature
cn<-f$V2
#reading the values of different features for test case
x1<-read.table("test/X_test.txt",sep="",col.names = cn)
#reading descriptive names for the activities
act_lab<-read.table("activity_labels.txt")
#reading test case activity file
y1<-read.table("test/y_test.txt")
#adding another column describing name of each activity against it's number
y1$activity<-act_lab$V2[match(y1$V1,act_lab$V1)]
#adding activity to the test case data frame
x1<-cbind(y1$activity,x1)
#reading the corresponding subject file for the test case
subj1<-read.table("test/subject_test.txt",col.names = "Subject")
#adding the subject number with the test case data frame
x1<-cbind(subj1$Subject,x1)

colnames(x1)[1]="subject"
colnames(x1)[2]="activity"

#selecting columns with mean and std in them to get the mean and standard deviation of each feature
sel_cn1<-grep(paste("mean|std",collapse="|"),colnames(x1),value = T,ignore.case = T)
sel_x1<-subset(x1,select=c("subject","activity",sel_cn1))


################### Train  case ####################

#performing same opertions as before for the train case

x2<-read.table("train//X_train.txt",sep="",col.names = cn)

y2<-read.table("train//y_train.txt")
y2$activity<-act_lab$V2[match(y2$V1,act_lab$V1)]

x2<-cbind(y2$activity,x2)
subj2<-read.table("train//subject_train.txt",col.names = "Subject")
x2<-cbind(subj2$Subject,x2)

colnames(x2)[1]="subject"
colnames(x2)[2]="activity"


sel_cn2<-grep(paste("mean|std",collapse="|"),colnames(x2),value = T,ignore.case = T)
sel_x2<-subset(x2,select=c("subject","activity",sel_cn2))


################# Merging test and train data sets####################

x_comb<-rbind(x1,x2)

##################### Tidy data set ##########################


td<-group_by(x_comb,subject,activity)
tidy_data<-summarise_each(td,funs(mean))

