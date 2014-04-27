## Project on cleaning the UCI Human Activity Recognition Dataset ##

#### Codebook ####

author: Dave Martin, 4/22/2014


##### filename: HumanActivityTidy.csv #####

This file is a tidy data subset of the original dataset, as contributed to the UCI Machine Learning Repository [1].  

The subset is a dataset of only the x variables that contain the regular expression mean() or std() in their labels.  There are 66 of these variables.  To the left are added the volunteer subject's id numbers and the activity they were performing for each row of observed data.

Variables 3 through 68 are the mean and standard deviations of processed sensor data.  They are separated into the X-Y-Z component axes.

1.	id: integer, 1 - 30, volunteer subjects' id number
2.	activity: factor with 6 levels -- walking, walking\_upstairs, walking\_downstairs, sitting, standing, laying
3.	tBodyAccmeanX: numeric, unmodified original data
4.	tBodyAccmeanY: numeric, unmodified original data
5.	tBodyAccmeanZ: numeric, unmodified original data
6.	tBodyAccstdX: numeric, unmodified original data
7.	tBodyAccstdY: numeric, unmodified original data
8.	tBodyAccstdZ: numeric, unmodified original data
9.	tGravityAccmeanX: numeric, unmodified original data
10.	tGravityAccmeanY: numeric, unmodified original data
11.	tGravityAccmeanZ: numeric, unmodified original data
12.	tGravityAccstdX: numeric, unmodified original data
13.	tGravityAccstdY: numeric, unmodified original data
14.	tGravityAccstdZ:numeric, unmodified original data
15.	tBodyAccJerkmeanX: numeric, unmodified original data
16.	tBodyAccJerkmeanY: numeric, unmodified original data
17.	tBodyAccJerkmeanZ: numeric, unmodified original data
18.	tBodyAccJerkstdX: numeric, unmodified original data
19.	tBodyAccJerkstdY: numeric, unmodified original data
20.	tBodyAccJerkstdZ: numeric, unmodified original data
21.	tBodyGyromeanX: numeric, unmodified original data
22.	tBodyGyromeanY: numeric, unmodified original data
23.	tBodyGyromeanZ: numeric, unmodified original data
24.	tBodyGyrostdX: numeric, unmodified original data
25.	tBodyGyrostdY: numeric, unmodified original data
26.	tBodyGyrostdZ: numeric, unmodified original data
27.	tBodyGyroJerkmeanX: numeric, unmodified original data
28.	tBodyGyroJerkmeanY: numeric, unmodified original data
29.	tBodyGyroJerkmeanZ: numeric, unmodified original data
30.	tBodyGyroJerkstdX: numeric, unmodified original data
31.	tBodyGyroJerkstdY: numeric, unmodified original data
32.	tBodyGyroJerkstdZ: numeric, unmodified original data
33.	tBodyAccMagmean: numeric, unmodified original data
34.	tBodyAccMagstd: numeric, unmodified original data
35.	tGravityAccMagmean: numeric, unmodified original data
36.	tGravityAccMagstd: numeric, unmodified original data
37.	tBodyAccJerkMagmean: numeric, unmodified original data
38.	tBodyAccJerkMagstd: numeric, unmodified original data
39.	tBodyGyroMagmean: numeric, unmodified original data
40.	tBodyGyroMagstd: numeric, unmodified original data
41.	tBodyGyroJerkMagmean: numeric, unmodified original data
42.	tBodyGyroJerkMagstd: numeric, unmodified original data
43.	fBodyAccmeanX: numeric, unmodified original data
44.	fBodyAccmeanY: numeric, unmodified original data
45.	fBodyAccmeanZ: numeric, unmodified original data
46.	fBodyAccstdX: numeric, unmodified original data
47.	fBodyAccstdY: numeric, unmodified original data
48.	fBodyAccstdZ: numeric, unmodified original data
49.	fBodyAccJerkmeanX: numeric, unmodified original data
50.	fBodyAccJerkmeanY: numeric, unmodified original data
51.	fBodyAccJerkmeanZ: numeric, unmodified original data
52.	fBodyAccJerkstdX: numeric, unmodified original data
53.	fBodyAccJerkstdY: numeric, unmodified original data
54.	fBodyAccJerkstdZ: numeric, unmodified original data
55.	fBodyGyromeanX: numeric, unmodified original data
56.	fBodyGyromeanY: numeric, unmodified original data
57.	fBodyGyromeanZ: numeric, unmodified original data
58.	fBodyGyrostdX: numeric, unmodified original data
59.	fBodyGyrostdY: numeric, unmodified original data
60.	fBodyGyrostdZ: numeric, unmodified original data
61.	fBodyAccMagmean: numeri, unmodified originalc data
62.	fBodyAccMagstd: numeric, unmodified original data
63.	fBodyBodyAccJerkMagmean: numeric, unmodified original data
64.	fBodyBodyAccJerkMagstd: numeric, unmodified original data
65.	fBodyBodyGyroMagmean: numeric, unmodified original data
66.	fBodyBodyGyroMagstd: numeric, unmodified original data
67.	fBodyBodyGyroJerkMagmean: numeric, unmodified original data
68.	fBodyBodyGyroJerkMagstd: numeric, unmodified original data



##### filename: Part5Tidy.csv #####

This is a tidy dataset of the averages of variables 3 through 68 of the HumanActivityTidy.csv dataset, described above.

The id and activity variables are the same as above. 

Variables 3 through 68 differ from the HumanActivityTidy.csv dataset by the appending of the string "Average" to the original variable names to distinguish them from the original variables and that they are the averages.  

For example, tBodyAccmeanXAverage is just the average value of tBodyAccmeanX values found in HumanActivityTidy.csv


1.	id: integer, 1 - 30, volunteer subjects' id number
2.	activity: factor with 6 levels -- walking, walking\_upstairs, walking\_downstairs, sitting, standing, laying
3.	tBodyAccmeanXAverage: numeric, average of original data
4.	tBodyAccmeanYAverage: numeric, average of original data
5.	tBodyAccmeanZAverage: numeric, average of original data
6.	tBodyAccstdXAverage: numeric, average of original data
7.	tBodyAccstdYAverage: numeric, average of original data
8.	tBodyAccstdZAverage: numeric, average of data
9.	tGravityAccmeanXAverage: numeric, average of original data
10.	tGravityAccmeanYAverage: numeric, average of original data
11.	tGravityAccmeanZAverage: numeric, average of original data
12.	tGravityAccstdXAverage: numeric, average of original data
13.	tGravityAccstdYAverage: numeric, average of original data
14.	tGravityAccstdZAverage:numeric, average of original data
15.	tBodyAccJerkmeanXAverage: numeric, average of original data
16.	tBodyAccJerkmeanYAverage: numeric, average of original data
17.	tBodyAccJerkmeanZAverage: numeric, average of original data
18.	tBodyAccJerkstdXAverage: numeric, average of original data
19.	tBodyAccJerkstdYAverage: numeric, average of original data
20.	tBodyAccJerkstdZAverage: numeric, average of original data
21.	tBodyGyromeanXAverage: numeric, average of original data
22.	tBodyGyromeanYAverage: numeric, average of original data
23.	tBodyGyromeanZAverage: numeric, average of original data
24.	tBodyGyrostdXAverage: numeric, average of original data
25.	tBodyGyrostdYAverage: numeric, average of original data
26.	tBodyGyrostdZAverage: numeric, average of original data
27.	tBodyGyroJerkmeanXAverage: numeric, average of original data
28.	tBodyGyroJerkmeanYAverage: numeric, average of original data
29.	tBodyGyroJerkmeanZAverage: numeric, average of original data
30.	tBodyGyroJerkstdXAverage: numeric, average of original data
31.	tBodyGyroJerkstdYAverage: numeric, average of original data
32.	tBodyGyroJerkstdZAverage: numeric, average of original data
33.	tBodyAccMagmeanAverage: numeric, average of original data
34.	tBodyAccMagstdAverage: numeric, average of original data
35.	tGravityAccMagmeanAverage: numeric, average of original data
36.	tGravityAccMagstdAverage: numeric, average of original data
37.	tBodyAccJerkMagmeanAverage: numeric, average of original data
38.	tBodyAccJerkMagstdAverage: numeric, average of original data
39.	tBodyGyroMagmeanAverage: numeric, average of original data
40.	tBodyGyroMagstdAverage: numeric, average of original data
41.	tBodyGyroJerkMagmeanAverage: numeric, average of original data
42.	tBodyGyroJerkMagstdAverage: numeri, average of originalc data
43.	fBodyAccmeanXAverage: numeric, average of original data
44.	fBodyAccmeanYAverage: numeric, average of original data
45.	fBodyAccmeanZAverage: numeric, average of original data
46.	fBodyAccstdXAverage: numeric, average of original data
47.	fBodyAccstdYAverage: numeric, average of original data
48.	fBodyAccstdZAverage: numeric, average of original data
49.	fBodyAccJerkmeanXAverage: numeric, average of original data
50.	fBodyAccJerkmeanYAverage: numeric, average of original data
51.	fBodyAccJerkmeanZAverage: numeric, average of original data
52.	fBodyAccJerkstdXAverage: numeric, average of original data
53.	fBodyAccJerkstdYAverage: numeric, average of original data
54.	fBodyAccJerkstdZAverage: numeric, average of original data
55.	fBodyGyromeanXAverage: numeric, average of original data
56.	fBodyGyromeanYAverage: numeric, average of original data
57.	fBodyGyromeanZAverage: numeric, average of original data
58.	fBodyGyrostdXAverage: numeric, average of original data
59.	fBodyGyrostdYAverage: numeric, average of original data
60.	fBodyGyrostdZAverage: numeric, average of original data
61.	fBodyAccMagmeanAverage: numeric, average of original data
62.	fBodyAccMagstdAverage: numeric, average of original data
63.	fBodyBodyAccJerkMagmeanAverage: numeric, average of original data
64.	fBodyBodyAccJerkMagstdAverage: numeric, average of original data
65.	fBodyBodyGyroMagmeanAverage: numeric, average of original data
66.	fBodyBodyGyroMagstdAverage: numeric, average of original data
67.	fBodyBodyGyroJerkMagmeanAverage: numeric, average of original data
68.	fBodyBodyGyroJerkMagstdAverage: numeric, average of original data


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012