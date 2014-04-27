## R script for Peer Assessment project
## for the Coursera Data Science Track course: Getting and Cleaning Data
##
## Written by David Martin
## 4/22/2014
## Contact: davekohlmartin '@' nospamplease-gmail.com
##
## R version 2.15.3 (2013-03-01)
## RStudio Version 0.98.501
##
## instructor: JT Leek

library(reshape2) ## will use melt() and dcast() from this library


## assume current working directory is the top level directory for the UCI HAR Dataset
## assume original directory structure is preserved as is unzipped from the UCI repository

baseDir <- getwd()

## get some initial stuff
actLbl <- read.table("activity_labels.txt") 
features <- read.table("features.txt")

## start reading training data

setwd(paste(baseDir, "/train", sep="")) 

subtrain <- read.table("subject_train.txt") 
xtrain <- read.table("x_train.txt") 
ytrain <- read.table("y_train.txt") 

## read test data

setwd(paste(baseDir, "/test", sep="")) ## test data is in a different directory

subtest <- read.table("subject_test.txt")
xtest <- read.table("x_test.txt")
ytest <- read.table("y_test.txt")

## merge all the data together

## stack the id train and id test sets together
complete.id <- rbind(subtrain, subtest)
colnames(complete.id) <- c("id")

## combine the y train and test datasets
complete.y <- rbind(ytrain, ytest)

## parts 3 and 4
## replace y index to human readable labels
yk <- as.vector(complete.y[[1]]) ## make a copy as vector -- replace() only works on vectors
al2 <- actLbl[, 2] ## get just the activity labels, stripped off of the index numbers

for(i in 1:length(al2)){
  yk <- replace(yk, yk == i, toString(al2[i]))  ## convert y integer codes into activity labels
}

activity <- yk
## parts 3 and 4 complete


## combine the x train and x test sets
complete.x <- rbind(xtrain, xtest)

## clean up the header/features names a bit so that R does not get confused and throw errors
f1 <- features[,2]          ## strip the index column off by taking only column 2
f2 <- gsub("\\()", "", f1)  ## remove all occurences of ()
f3 <- gsub("\\(", "", f2)   ## remove all (
f4 <- gsub("\\)", "", f3)   ## remove all )
f5 <- gsub("\\-", "", f4)   ## remove all -
f6 <- gsub("\\,", ".", f5)  ## change , (commas) to . (full stops)

x.header <- f6                    ## redundant step, just to make things easier to read
colnames(complete.x) <- x.header  ## add the finished header to the x portion of the data

## combine all the parts to get the final combined dataset with activity labels
complete.data <- cbind(complete.id, activity, complete.x)

## part 1 is done

## start part 2
## extract the mean() and std() variables from the complete.data set as required
##
## grep the features list for mean() and std()

header.all <- features[, 2] ## create another list of the original features to work with
h2 <- grep("mean\\()", header.all, ignore.case = F) ## results in a list of integers corresponding positions for variables that contain "mean()"
h3 <- grep("std\\()", header.all, ignore.case = F) ## create a index vector for variables with "std()" in them
h4 <- append(h2, h3) ## combine the two
h5 <- sort(h4) + 2 ## sort the combined list for neatness, then realign the index by 2, features index start at 1, differ from complete.data by 2
h6 <- append(c(1, 2), h5) ## add columns 1 and 2 for extracting the data, columns 1 and 2 correspond to subject id and activity

## h6 is an index list/vector of all the columns that should be extracted from complete.data
new.x <- complete.data[, h6] ## create the new data frame

## part 2 is complete, new.x is a smaller dataset that contains just the columns of subjectid (id), y (y), activity (activity), mean (mean) and standard deviations (Std) and nothing else

## create a tidy data set for part 2

## prepare to melt the data
## build the the measure.vars

newheader <- colnames(new.x)
n <- length(newheader)
measurevar <- newheader[3:n] ## id and activity are not part of measure.vars, so start from 3


## tidy up the mean(), std() dataset by melting
## tidyx is the finished required product for parts 1, 2, 3, & 4
tidyx <- melt(new.x, id.vars = c("id", "activity"), measure.vars = measurevar) 

## tidyx is the tidy data set "equivalent" of new.x

## save the tidy dataset
setwd(baseDir)
write.csv(tidyx, file = "HumanActivityTidy.csv", row.names=FALSE)

## part 5: cast the molten dataset and 
## aggregate tidyx variables for the average of the columns

part5.dcast <- dcast(tidyx, id + activity~variable, fun.aggregate = mean)

## rename headers to reflect averaged values by 
## appending the string "Average" to all the 
## variable names for part5.dcast

p5header <- colnames(part5.dcast)
p5header1 <- p5header[3:length(p5header)]
p5header2 <- paste(p5header1, "Average", sep="")
p5header3 <- append(p5header[1:2], p5header2)
colnames(part5.dcast) <- p5header3

## tidy up the casted dataframe (part5.dcast) by melting it
## this is required for part 5, independent, second tidy data set

dcastheader <- colnames(part5.dcast)
mvar <- dcastheader[4:length(dcastheader)]
part5.tidy <- melt(part5.dcast, id.vars = c("id", "activity"), measure.vars = mvar)

## save the part 5 dataset
setwd(baseDir)
write.csv(part5.tidy, file = "Part5Tidy.csv", row.names=FALSE)

## part 5 is complete!  
## part5.tidy is the final tidy data set
## second tidy data set of the averages of mean and standard deviation variables from the original data
## end of script