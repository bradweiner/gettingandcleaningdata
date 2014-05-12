Tidy Data Set Code Book
=======================

Basic Description
-----------------

tidy.txt is a tab-separated file compiled from Human Activity Recognition Using Smartphones Dataset
Version 1.0.

Columns = 84
Rows = 180
Unique Individuals = 30
Unique Exercises = 6

This dataset is a reduced and cleaned version of a larger data set which measured movement
along three axis (X, Y, Z) from both accelerometers and body movement among participants wearing smart-phone enabled exercise tracking devices. 

Variables starting with "t" denote time measurements, and those beginning with "f" denote measurements with Fourier frequency transformations.

**All Variables** represent the **mean** value for each participant for each excercise (including th
e standard deviations (Std) which represent the average standard deviation for that measure per participant (1-30) per exercise motion (1-6)).

For more information on the original data set please see the OriginalDataREADME.txt

Data Cleaning and Transformations
---------------------------------

1. Test and training sets were combined
2. Only variables measuring the means and standard deviations of the collected data were included. This reduced number of measures
from 561 to 79.
3. Five identifying variables were added (SubjectID, ActivityDescr, ActivityID, TestSet, Training Set). 
4. Variable names were re-coded to be consistant and to delete non-alphanumeric characters. 
5. Total data set was collapsed to calculate the mean for each variable (n=79) for each participant (n=30) for each exercise (n=6) 
6. Exports tab delimited file called tidy.txt

Variable Naming
---------------

Variable naming was attempted to make readability easier. Each descriptive element of variable names was capitalized. This is an element of personal preference to easily identify differences in many similarly-titled variables. Variable names are listed below:

 [1] "SubjectID"                   
 [2] "ActivityDescr"               
 [3] "ActivityID"                  
 [4] "TestSet"                     
 [5] "TrainingSet"                 
 [6] "Avg_tBodyAccMeanX"               
 [7] "Avg_tBodyAccMeanY"               
 [8] "Avg_tBodyAccMeanZ"               
 [9] "Avg_tBodyAccStdX"                
[10] "Avg_tBodyAccStdY"                
[11] "Avg_tBodyAccStdZ"                
[12] "Avg_tGravityAccMeanX"            
[13] "Avg_tGravityAccMeanY"            
[14] "Avg_tGravityAccMeanZ"            
[15] "Avg_tGravityAccStdX"             
[16] "Avg_tGravityAccStdY"             
[17] "Avg_tGravityAccStdZ"             
[18] "Avg_tBodyAccJerkMeanX"           
[19] "Avg_tBodyAccJerkMeanY"           
[20] "Avg_tBodyAccJerkMeanZ"           
[21] "Avg_tBodyAccJerkStdX"            
[22] "Avg_tBodyAccJerkStdY"            
[23] "Avg_tBodyAccJerkStdZ"            
[24] "Avg_tBodyGyroMeanX"              
[25] "Avg_tBodyGyroMeanY"              
[26] "Avg_tBodyGyroMeanZ"              
[27] "Avg_tBodyGyroStdX"               
[28] "Avg_tBodyGyroStdY"               
[29] "Avg_tBodyGyroStdZ"               
[30] "Avg_tBodyGyroJerkMeanX"          
[31] "Avg_tBodyGyroJerkMeanY"          
[32] "Avg_tBodyGyroJerkMeanZ"          
[33] "Avg_tBodyGyroJerkStdX"           
[34] "Avg_tBodyGyroJerkStdY"           
[35] "Avg_tBodyGyroJerkStdZ"           
[36] "Avg_tBodyAccMagMean"             
[37] "Avg_tBodyAccMagStd"              
[38] "Avg_tGravityAccMagMean"          
[39] "Avg_tGravityAccMagStd"           
[40] "Avg_tBodyAccJerkMagMean"         
[41] "Avg_tBodyAccJerkMagStd"          
[42] "Avg_tBodyGyroMagMean"            
[43] "Avg_tBodyGyroMagStd"             
[44] "Avg_tBodyGyroJerkMagMean"        
[45] "Avg_tBodyGyroJerkMagStd"         
[46] "Avg_fBodyAccMeanX"               
[47] "Avg_fBodyAccMeanY"               
[48] "Avg_fBodyAccMeanZ"               
[49] "Avg_fBodyAccStdX"                
[50] "Avg_fBodyAccStdY"                
[51] "Avg_fBodyAccStdZ"                
[52] "Avg_fBodyAccMeanFreqX"           
[53] "Avg_fBodyAccMeanFreqY"           
[54] "Avg_fBodyAccMeanFreqZ"           
[55] "Avg_fBodyAccJerkMeanX"           
[56] "Avg_fBodyAccJerkMeanY"           
[57] "Avg_fBodyAccJerkMeanZ"           
[58] "Avg_fBodyAccJerkStdX"            
[59] "Avg_fBodyAccJerkStdY"            
[60] "Avg_fBodyAccJerkStdZ"            
[61] "Avg_fBodyAccJerkMeanFreqX"       
[62] "Avg_fBodyAccJerkMeanFreqY"       
[63] "Avg_fBodyAccJerkMeanFreqZ"       
[64] "Avg_fBodyGyroMeanX"              
[65] "Avg_fBodyGyroMeanY"              
[66] "Avg_fBodyGyroMeanZ"              
[67] "Avg_fBodyGyroStdX"               
[68] "Avg_fBodyGyroStdY"               
[69] "Avg_fBodyGyroStdZ"               
[70] "Avg_fBodyGyroMeanFreqX"          
[71] "Avg_fBodyGyroMeanFreqY"          
[72] "Avg_fBodyGyroMeanFreqZ"          
[73] "Avg_fBodyAccMagMean"             
[74] "Avg_fBodyAccMagStd"              
[75] "Avg_fBodyAccMagMeanFreq"         
[76] "Avg_fBodyBodyAccJerkMagMean"     
[77] "Avg_fBodyBodyAccJerkMagStd"      
[78] "Avg_fBodyBodyAccJerkMagMeanFreq" 
[79] "Avg_fBodyBodyGyroMagMean"        
[80] "Avg_fBodyBodyGyroMagStd"         
[81] "Avg_fBodyBodyGyroMagMeanFreq"    
[82] "Avg_fBodyBodyGyroJerkMagMean"    
[83] "Avg_fBodyBodyGyroJerkMagStd"     
[84] "Avg_fBodyBodyGyroJerkMagMeanFreq"

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

Data Downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

on May 5, 2014