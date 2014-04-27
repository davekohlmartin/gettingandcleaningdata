## Run\_Analysis.R

by Dave Martin, 4/22/2014
### How it Works

Run_Analysis.R is the R script that will clean and set up the UCI-HAR dataset [1] for analysis according to stated requirements.

The script accomplishes this by:

1.  merging the training and testing datasets into one named "complete.data"
2.  building a subset dataset named "new.x" by extracting the mean() and std() variables from complete.data
3.  creating a tidy dataset of new.x, named "tidyx"
4.  casting "tidyx" for the averages of all the variables and setting "id" and "activity" as the rows on the left.  The the rest go across the top.  The result is named "part5.dcast".  It is a wide dataset and can be considered "messy".
5.  casting "part5.dcast" using "id" and "activity" as id.vars and the rest as measure.vars, this resulting dataset is tidy and is named "part5.tidy".


### details ###

##### merging #####

1. read in activity labels
2. read in features list
3. read in subject, y, and x data for both train and test sets
4. convert y from their integer representations to the corresponding activity label
5. remove parentheses and hyphens from the features list.  Replace commas with periods.  This step cleans up the features labels to prevent any confusion in R.  The period is used to replace commas to preserve the numeric integrity of the labels
6. build the complete dataset, named complete.data, by stacking the training and testing sets but building the subject id, activity, and x observations in parallel


##### building a subset dataset with only mean() and std() variables

1. read the column names from the complete.data data set
2. use grep to create a vector that list columns that contain mean() or std() in their variable names
3. use this vector to pull a subset from complete.data (note: include the "id" and "activity" columns), name this subset "new.x"



##### creating a tidy data set of the subsetted data frame

1. use melt() from the reshape package to create the tidy data set
	* id.vars = c("id", "activity")
	* measure.vars = column names except "id" and "activity"
	* measure.vars = measurevar = header[3:length(header)]
	* tidyx <- melt(new.x, id.vars = c("id", "activity"), measure.vars = measurevar) 
2. name it tidyx



##### casting tidyx to calculate averages of all variables

1. use dcast() from reshape2: 
	* part5.dcast <- dcast(tidyx, id + activity~variable, fun.aggregate = mean)
2. id + activity is what is desired for the left part of the resulting data table, running down the left side
3. everything to the right of the tilde ~ will tabulate as headers over the top
4. fun.aggregate = mean tells dcast to aggregate the data by taking the mean (or average)


###### tidying up the cast dataset

1. use melt() again:
	* part5.tidy <- melt(part5.dcast, id.vars = c("id", "activity"), measure.vars = mvar)
	* where mvar is just the header minus the first two entries, i.e. "id" and "activity"
2. save this data set.


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012