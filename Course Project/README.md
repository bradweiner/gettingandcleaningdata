Tidy Data Set Code Book
========================================================

This code combines the test and training sets from the Human Activity Recognition Using Smartphones Dataset Version 1.0. It then reduces the total number of variables and calculates an average for every participant (1-30) for every excercise (1-6). This results in a final data set with 180 rows.

It is highly recommended that you read the ReadMe files and Code Book prior to working with this data set.
-----------------------------------------------------------------------------------------------------------------------

### Required Data Files (9 Total)
* Test Data Set (X_test.txt)
* Training Data Set (X_train.txt)
* Test Data Subject List (subject_test.txt)
* Training Data Subject List (subject_train.txt)
* Test Data Set Activity List (y_test.txt)
* Training Data Set Activity List (y_train.txt)
* Features/Raw Variable Name List (features.txt)
* Activity List Lables (activity_labels.txt)

### R Code for Data Transformations
* Data Cleaning and Transformation Code (run_analysis.R)

### Description Files and References (3 Total)
* Tidy Data Set Code Book (CodeBook.md)
* Descriptions of Raw Variables/Features and data collection (features_info)
* Description of Raw Data set (RAW_DATA_README.txt)

#Imports Training Set 
```{r}
xtest <- 
        read.table("X_test.txt",
                   header=FALSE, sep="", na.strings="NA", dec=".", strip.white=TRUE)
```

#Import Test Subject List. n=30
```{r}
subjecttest <- 
        read.table("subject_test.txt",
                   header=FALSE, sep="", na.strings="NA", dec=".", strip.white=TRUE)
```
#Import Test Exercise List. n=6
```{r}
ytest <- 
        read.table("y_test.txt",
                   header=FALSE, sep="", na.strings="NA", dec=".", strip.white=TRUE)
```
#Import Features. For more information on study design, see file features_info.txt in Github folder. n=561
```{r}
features <- 
        read.table("features.txt",
                   header=FALSE, sep="", na.strings="NA", dec=".", strip.white=TRUE)
```
#Removes punctuation and non alpha characters from feature names
```{r}
features$V3<-gsub("[[:punct:]]", "", features$V2)
```
#assigns new cleaned up feature names to vector
```{r}
feature.vector<-as.vector(features$V3)
```
#assigns cleaned up feature names as column names to Test Set
```{r}
colnames(xtest)<-feature.vector
```
#assigns Subject IDs (1-30) to test set
```{r}
xtest$SubjectID<-subjecttest$V1
```
#assigns Activity IDs (1-6) to test set
```{r}
xtest$ActivityID<-ytest$V1
```
#Creates dummy-coded variables to later identify cases from test and training sets
```{r}
xtest$TestSet<-1
xtest$TrainingSet<-0
```
#Import data from training Set
```{r}
xtrain <- 
        read.table("X_train.txt",
                   header=FALSE, sep="", na.strings="NA", dec=".", strip.white=TRUE)
subjecttrain <- 
        read.table("subject_train.txt",
                   header=FALSE, sep="", na.strings="NA", dec=".", strip.white=TRUE)
ytrain <- 
        read.table("y_train.txt",
                   header=FALSE, sep="", na.strings="NA", dec=".", strip.white=TRUE)
```

#assigns cleaned up feature names as column names to training Set
```{r}
colnames(xtrain)<-feature.vector
```
#assigns Subject IDs (1-30) to training set
```{r}
xtrain$SubjectID<-subjecttrain$V1
```
#assigns Activity IDs (1-6) to training set
```{r}
xtrain$ActivityID<-ytrain$V1
```
#Creates dummy-coded variables to later identify cases from test and training sets
```{r}
xtrain$TestSet<-0
xtrain$TrainingSet<-1
```
#Merge Test and Training Sets
```{r}
masterfile<-rbind(xtrain,xtest)
```
#Assign formal descriptions to the activity IDs. For raw data description
```{r}
# please see activity_labels.txt in Github folder
masterfile$ActivityDescr<-NA
masterfile$ActivityDescr[masterfile$ActivityID==1]<-"WALKING"
masterfile$ActivityDescr[masterfile$ActivityID==2]<-"WALKING_UPSTAIRS"
masterfile$ActivityDescr[masterfile$ActivityID==3]<-"WALKING_DOWNSTAIRS"
masterfile$ActivityDescr[masterfile$ActivityID==4]<-"SITTING"
masterfile$ActivityDescr[masterfile$ActivityID==5]<-"STANDING"
masterfile$ActivityDescr[masterfile$ActivityID==6]<-"LAYING"
```
#Subset Columns that are feature mean values
```{r}
means<-grepl("mean",feature.vector)
```
#Subset columns that are feature standard deviation features (std)
```{r}
sd<-grepl("std",feature.vector)
```
#combine variable subsets to include only mean and standard deviation features
```{r}
meansd<-means+sd
```
#build a vector to select correct column names (five columns added for 
```{r}
#variables created for this analysis).
```{r}
meansd<-c(meansd,1,1,1,1,1)
```
#create data frame for the column names
```{r}
columns<-as.data.frame(meansd)
columns$ID<-1:566
```
#select only columns with indicator of a mean or std feature
```{r}
selectedcolumns<-subset(columns,meansd==1)
```
#create a master file with the correct data and the correct columns
```{r}
master.file.columns<-as.vector(selectedcolumns$ID)
master.file.fewercols<-masterfile[, master.file.columns]
```
#create a master file with the Identification variables (80-84) listed first among the column names
```{r}
mfo<-as.data.frame(master.file.fewercols[, c(80:84, 1:79)])
```
#aggregate each of the features by the Subject and the Activity. Calculate means and standard deviations
#This file should produce 180 total rows 
```{r}
mfo.summary<-aggregate(.~SubjectID+ActivityDescr,FUN=mean,data=mfo)
```
#Produce final "tidy" file ordered by Subject ID and Activity ID for readability. This includes 84 total columns and 180 total rows. One row per participant per activity (30*6). There are 80 features with mean or std calculations from the original data set, and four columns for identification and deconstruction. The TrainingSet and TestSet variables can be utilized later to determine which cases existing in each of the original sets.
```{r}
tidy<-mfo.summary[order(mfo.summary$SubjectID,mfo.summary$ActivityID), ]
```
#changes mean to Mean in feature names
```{r}
colnames(tidy)<-gsub("mean", "Mean", colnames(tidy))
```
#changes mean to Mean in feature names
```{r}
colnames(tidy)<-gsub("std", "Std", colnames(tidy))
```
```{r}
#adds Avg to each variable name
colnames(tidy)[6:84]<-paste("Avg_", colnames(tidy),sep="")
```
#export tidy data file to tab delimited .txt
```{r}
write.table(tidy, "tidy.txt", sep="\t")
```



