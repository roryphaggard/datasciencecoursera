runAnalysis <- function() {
## Get all of the data into R
    trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
    xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
    yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
    testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
    xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
    yTest <- read.table("UCI HAR Dataset/test/y_test.txt")

## Import plyr and get to work!
    library(plyr)
    library(dplyr)
### Start renaming columns
    trainSubject <- rename(trainSubject, replace = c("V1" = "Subject"))
    testSubject <- rename(testSubject, replace = c("V1" = "Subject"))
    yTrain <- rename(yTrain, replace = c("V1" = "Movement"))
    yTest <- rename(yTest, replace = c("V1" = "Movement"))
### Transform movement codes into actual movement names
    yTrain$Movement <- gsub("1", "Walking", yTrain$Movement)
    yTrain$Movement <- gsub("2", "Walking_Upstairs", yTrain$Movement)
    yTrain$Movement <- gsub("3", "Walking_Downstairs", yTrain$Movement)
    yTrain$Movement <- gsub("4", "Sitting", yTrain$Movement)
    yTrain$Movement <- gsub("5", "Standing", yTrain$Movement)
    yTrain$Movement <- gsub("6", "Laying", yTrain$Movement)
    yTest$Movement <- gsub("1", "Walking", yTest$Movement)
    yTest$Movement <- gsub("2", "Walking_Upstairs", yTest$Movement)
    yTest$Movement <- gsub("3", "Walking_Downstairs", yTest$Movement)
    yTest$Movement <- gsub("4", "Sitting", yTest$Movement)
    yTest$Movement <- gsub("5", "Standing", yTest$Movement)
    yTest$Movement <- gsub("6", "Laying", yTest$Movement)
### Slice out the stuff that doesn't matter for our purposes
    xTrainFrame <- xTrain[,c("V1","V2","V3","V4","V5","V6","V41","V42","V43",
                             "V44","V45","V46","V81","V82","V83","V84","V85",
                             "V86","V121","V122","V123","V124","V125","V126",
                             "V161","V162","V163","V164","V165","V166","V201",
                             "V202","V214","V215","V227","V228","V240","V241",
                             "V253","V254","V266","V267","V268","V269","V270",
                             "V271","V294","V295","V296","V345","V346","V347",
                             "V348","V349","V350","V373","V374","V375","V424",
                             "V425","V426","V427","V428","V429","V452","V453",
                             "V454","V503","V504","V513","V516","V517","V526",
                             "V529","V530","V539","V542","V543","V552")]
    xTestFrame <- xTest[,c("V1","V2","V3","V4","V5","V6","V41","V42","V43",
                          "V44","V45","V46","V81","V82","V83","V84","V85",
                          "V86","V121","V122","V123","V124","V125","V126",
                          "V161","V162","V163","V164","V165","V166","V201",
                          "V202","V214","V215","V227","V228","V240","V241",
                          "V253","V254","V266","V267","V268","V269","V270",
                          "V271","V294","V295","V296","V345","V346","V347",
                          "V348","V349","V350","V373","V374","V375","V424",
                          "V425","V426","V427","V428","V429","V452","V453",
                          "V454","V503","V504","V513","V516","V517","V526",
                          "V529","V530","V539","V542","V543","V552")]
### Renames all of the columns to be descriptive    
    xTrainFrame <- rename(xTrainFrame, triaxialBodyAccMeanXAxis = V1,
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
                          frequencyBodyGyroJerkMagStandardDeviation = V543)
    xTestFrame <- rename(xTestFrame, triaxialBodyAccMeanXAxis = V1,
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
                         frequencyBodyGyroJerkMagStandardDeviation = V543)

## Create the final version of the data frame
finalFrame <- some(stuff, happens)
## Output the final data frame
write(finalFrame, "stuff?")
}
#testFrame <- cbind(testSubject,yTest,xTest)
#trainFrame <- cbind(trainSubject,yTrain,xTrain)
#fullFrame <- rbind(testFrame,trainFrame)
