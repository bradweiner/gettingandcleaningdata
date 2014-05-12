##This code combines the test and training sets from the Human Activity Recognition Using Smartphones Dataset
##Version 1.0. It is highly recommended that you read the ReadMe files and Code Book prior to working
## with this data set.##

#Imports Training Set 
xtest <- 
        read.table("X_test.txt",
                   header=FALSE, sep="", na.strings="NA", dec=".", strip.white=TRUE)


#Import Test Subject List. n=30
subjecttest <- 
        read.table("subject_test.txt",
                   header=FALSE, sep="", na.strings="NA", dec=".", strip.white=TRUE)

#Import Test Exercise List. n=6
ytest <- 
        read.table("y_test.txt",
                   header=FALSE, sep="", na.strings="NA", dec=".", strip.white=TRUE)
#Import Features. For more information on study design, see file features_info.txt
# in Github folder. n=561
features <- 
        read.table("features.txt",
                   header=FALSE, sep="", na.strings="NA", dec=".", strip.white=TRUE)

#Removes punctuation and non alpha characters from feature names
features$V3<-gsub("[[:punct:]]", "", features$V2)

#assigns new cleaned up feature names to vector
feature.vector<-as.vector(features$V3)

#assigns cleaned up feature names as column names to Test Set
colnames(xtest)<-feature.vector

#assigns Subject IDs (1-30) to test set
xtest$SubjectID<-subjecttest$V1

#assigns Activity IDs (1-6) to test set
xtest$ActivityID<-ytest$V1

#Creates dummy-coded variables to later identify cases from test and training sets
xtest$TestSet<-1
xtest$TrainingSet<-0

#Import data from training Set

xtrain <- 
        read.table("X_train.txt",
                   header=FALSE, sep="", na.strings="NA", dec=".", strip.white=TRUE)
subjecttrain <- 
        read.table("subject_train.txt",
                   header=FALSE, sep="", na.strings="NA", dec=".", strip.white=TRUE)
ytrain <- 
        read.table("y_train.txt",
                   header=FALSE, sep="", na.strings="NA", dec=".", strip.white=TRUE)

#assigns cleaned up feature names as column names to training Set
colnames(xtrain)<-feature.vector

#assigns Subject IDs (1-30) to training set
xtrain$SubjectID<-subjecttrain$V1
#assigns Activity IDs (1-6) to training set
xtrain$ActivityID<-ytrain$V1

#Creates dummy-coded variables to later identify cases from test and training sets
xtrain$TestSet<-0
xtrain$TrainingSet<-1

# Merge Test and Training Sets
masterfile<-rbind(xtrain,xtest)

#Assign formal descriptions to the activity IDs. For raw data description
# please see activity_labels.txt in Github folder
masterfile$ActivityDescr<-NA
masterfile$ActivityDescr[masterfile$ActivityID==1]<-"WALKING"
masterfile$ActivityDescr[masterfile$ActivityID==2]<-"WALKING_UPSTAIRS"
masterfile$ActivityDescr[masterfile$ActivityID==3]<-"WALKING_DOWNSTAIRS"
masterfile$ActivityDescr[masterfile$ActivityID==4]<-"SITTING"
masterfile$ActivityDescr[masterfile$ActivityID==5]<-"STANDING"
masterfile$ActivityDescr[masterfile$ActivityID==6]<-"LAYING"

#Subset Columns that are feature mean values
means<-grepl("mean",feature.vector)

#Subset columns that are feature standard deviation features (std)
sd<-grepl("std",feature.vector)

#combine variable subsets to include only mean and standard deviation features
meansd<-means+sd

#build a vector to select correct column names (five columns added for 
#variables created for this analysis).
meansd<-c(meansd,1,1,1,1,1)

#create data frame for the column names
columns<-as.data.frame(meansd)
columns$ID<-1:566

#select only columns with indicator of a mean or std feature
selectedcolumns<-subset(columns,meansd==1)

#create a master file with the correct data and the correct columns
master.file.columns<-as.vector(selectedcolumns$ID)
master.file.fewercols<-masterfile[, master.file.columns]

#create a master file with the Identification variables (80-84) listed first among the column names
mfo<-as.data.frame(master.file.fewercols[, c(80:84, 1:79)])

#aggregate each of the features by the Subject and the Activity. Calculate means and standard deviations
#This file should prodce 180 total rows ()
mfo.summary<-aggregate(.~SubjectID+ActivityDescr,FUN=mean,data=mfo)

#Produce final "tidy" file ordered by Subject ID and Activity ID for readability. This includes 84 total columns
#and 180 total rows. One row per participant per activity (30*6). There are 80 features with
#mean or std calculations from the original data set, and four columns for identification and deconstruction.
#The TrainingSet and TestSet variables can be utilized later to determine which cases existing in each
#of the original sets.
tidy<-mfo.summary[order(mfo.summary$SubjectID,mfo.summary$ActivityID), ]

#changes mean to Mean in feature names
colnames(tidy)<-gsub("mean", "Mean", colnames(tidy))

#changes mean to Mean in feature names
colnames(tidy)<-gsub("std", "Std", colnames(tidy))

#adds Avg to each variable name
colnames(tidy)[6:84]<-paste("Avg_", colnames(tidy),sep="")

#export tidy data file to tab delimited .txt
write.table(tidy, "tidy.txt", sep="\t")








