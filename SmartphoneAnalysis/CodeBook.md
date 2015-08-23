# Code Book for UCI HAR Dataset and run_analysis.R

### About the Initial Dataset
The initial dataset is the "UCI HAR Data Set" from the UCI Machine Learning [repository](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip).  This data was colllected from 30 volunteers with the aid of the ssensors onboard Samsung Galaxy SII smartphones.  The participants were asked to perform a number of different activities while being recorded on video.  

Additional information this experiment is available from the [HAR@SMARTLAB](https://sites.google.com/site/harsmartlab/) website.

### What Was Done To Acheive the Tidy Dataset
The primary purpose of the run_analysis.R script is to summarize the data and make it more human readable.  In addition to the raw data, the "UCI HAR Data Set" includes a large table that includes derived mean and standard deviation information.  The included R script separates out this column data specifically and gives it a human readable label based on the "features.txt" file in the dataset's zip file. Additionally "activity_labels.txt" is used to provide the "Movement" column with human readable values.

The final data set includes both the "train" and the "test" data, as the initial division between the two set was an arbitrary split for the purposes of training machine learning algorithms.  All of the data is from a single set of experimental data and can be treated as such.

For further information on how to use run_analysis.R, please see the README.md file.

### What the Tidy Dataset Includes
The final output of run_analysis.R, tidy_dataset.txt, includes the following columns of data from both the "train" and "test" files:

triaxialBodyAccMeanXAxis = V1,
triaxialBodyAccMeanYAxis = V2,
triaxialBodyAccMeanZAxis = V3,
triaxialGravityAccMeanXAxis = V41,
triaxialGravityAccMeanYAxis = V42,
triaxialGravityAccMeanZAxis = V43,
triaxialBodyAccJerkMeanXAxis = V81,
triaxialBodyAccJerkMeanYAxis = V82,
triaxialBodyAccJerkMeanZAxis = V83,
triaxialBodyGyroMeanXAxis = V121,
triaxialBodyGyroMeanYAxis = V122,
triaxialBodyGyroMeanZAxis = V123,
triaxialBodyGyroJerkMeanXAxis = V161,
triaxialBodyGyroJerkMeanYAxis = V162,
triaxialBodyGyroJerkMeanZAxis = V163,
triaxialBodyAccMagMean = V201,
triaxialGravityAccMagMean = V214,
triaxialBodyAccJerkMagMean = V227,
triaxialBodyGyroMagMean = V240,
triaxialBodyGyroJerkMagMean = V253,
frequencyBodyAccMeanXAxis = V266,
frequencyBodyAccMeanYAxis = V267,
frequencyBodyAccMeanZAxis = V268,
frequencyBodyAccMeanFreqXAxis = V294,
frequencyBodyAccMeanFreqYAxis = V295,
frequencyBodyAccMeanFreqZAxis = V296,
frequencyBodyAccJerkMeanXAxis = V345,
frequencyBodyAccJerkMeanYAxis = V346,
frequencyBodyAccJerkMeanZAxis = V347,
frequencyBodyAccJerkMeanFreqXAxis = V373,
frequencyBodyAccJerkMeanFreqYAxis = V374,
frequencyBodyAccJerkMeanFreqZAxis = V375,
frequencyBodyGyroMeanXAxis = V424,
frequencyBodyGyroMeanYAxis = V425,
frequencyBodyGyroMeanZAxis = V426,
frequencyBodyGyroMeanFreqXAxis = V452,
frequencyBodyGyroMeanFreqYAxis = V453,
frequencyBodyGyroMeanFreqZAxis = V454,
frequencyBodyAccMagMean = V503,
frequencyBodyAccMagMeanFreq = V513,
frequencyBodyAccJerkMagMean = V516,
frequencyBodyAccJerkMagMeanFreq = V526,
frequencyBodyGyroMagMean = V529,
frequencyBodyGyroMagMeanFreq = V539,
frequencyBodyGyroJerkMagMean = V542,
frequencyBodyGyroJerkMagMeanFreq = V552,
triaxialBodyAccStandardDeviationXAxis = V4,
triaxialBodyAccStandardDeviationYAxis = V5,
triaxialBodyAccStandardDeviationZAxis = V6,
triaxialGravityAccStandardDeviationXAxis = V44,
triaxialGravityAccStandardDeviationYAxis = V45,
triaxialGravityAccStandardDeviationZAxis = V46,
triaxialBodyAccJerkStandardDeviationXAxis = V84,
triaxialBodyAccJerkStandardDeviationYAxis = V85,
triaxialBodyAccJerkStandardDeviationZAxis = V86,
triaxialBodyGyroStandardDeviationXAxis = V124,
triaxialBodyGyroStandardDeviationYAxis = V125,
triaxialBodyGyroStandardDeviationZAxis = V126,
triaxialBodyGyroJerkStandardDeviationXAxis = V164,
triaxialBodyGyroJerkStandardDeviationYAxis = V165,
triaxialBodyGyroJerkStandardDeviationZAxis = V166,
triaxialBodyAccMagStandardDeviation = V202,
triaxialGravityAccMagStandardDeviation = V215,
triaxialBodyAccJerkMagStandardDeviation = V228,
triaxialBodyGyroMagStandardDeviation = V241,
triaxialBodyGyroJerkMagStandardDeviation = V254,
frequencyBodyAccStandardDeviationXAxis = V269,
frequencyBodyAccStandardDeviationYAxis = V270,
frequencyBodyAccStandardDeviationZAxis = V271,
frequencyBodyAccJerkStandardDeviationXAxis = V348,
frequencyBodyAccJerkStandardDeviationYAxis = V349,
frequencyBodyAccJerkStandardDeviationZAxis = V350,
frequencyBodyGyroStandardDeviationXAxis = V427,
frequencyBodyGyroStandardDeviationYAxis = V428,
frequencyBodyGyroStandardDeviationZAxis = V429,
frequencyBodyAccMagStandardDeviation = V504,
frequencyBodyAccJerkMagStandardDeviation = V517,
frequencyBodyGyroMagStandardDeviation = V530,
frequencyBodyGyroJerkMagStandardDeviation = V543

For the sake of brevity in the column names "Acc" is short for "Acceleration" and "Gyro" is short for "Gyroscopic."

All data in columns that contain "TotalAcc" or "BodyAcc" are in the standard gravity unit of "g".  All data in columns that contain "Gyro" represent angular velocity and in radians/second.

For all further information about the original dataset, please see the README.txt file included in the dataset's zipfile.
