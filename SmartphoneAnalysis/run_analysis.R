## Get all of the data into R
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
testMerge <- merge.data.frame(xTest,yTest)
testMerge <- merge(xTest,yTest)
testFrame <- cbind(testSubject,yTest,xTest)
trainFrame <- cbind(trainSubject,yTrain,xTrain)
fullFrame <- rbind(testFrame,trainFrame)

## Import plyr and dplyr and get to work!
library(plyr)
library(dplyr)

## Output the final data frame
write(finalFrame, "stuff?")