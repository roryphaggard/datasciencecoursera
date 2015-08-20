## Get all of the data into R
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")

## Import plyr and get to work!
library(plyr)
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
xTrain
xTest



## Create the final version of the data frame
finalFrame <- some(stuff, happens)
## Output the final data frame
write(finalFrame, "stuff?")

#testFrame <- cbind(testSubject,yTest,xTest)
#trainFrame <- cbind(trainSubject,yTrain,xTrain)
#fullFrame <- rbind(testFrame,trainFrame)
