# Code Book for *Getting and Cleaning Data* Course Project

This provides a description of the variables, the data, and the transformations that were undertaken to clean up the data

## Data Location and Files
The data was scattered across multiple files and only a subset of all the files from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) are used, see the README file for further details.

## Combining the Data
All of the separate data sets were loaded into R and then combined into a single data set using `cbind` and `rbind` for easier manipulation when cleaning data.

## Only Extract Mean and Standard Deviation
The goal was to only extract the `mean` and `STD` measurements, so the `grepl` function was used to identify the columns in the combined data and only subset those columns.

## Replacing Activity Numeric Values with Descriptive Labels
The original activity values in the data set were displayed as numeric values, so that column was turned into a factor with two levels: the numeric value and the corresponding written description.

## Creating a Second Tidy Set Showing the Average of all Observations by Each Subject and Activity
The `dplyr` package is used to accomplish this step, using `group_by` and `summarize_all(funs(mean))` functions to do so.

## Variables/Features

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

## Detailed List of Variables

- Subject
  - The subject's unique ID
    - Possible Values: (1-30)
- Activity
  - The action the subject is performing
    - Possible Values:
      - LAYING
      - SITTING
      - STANDING
      - WALKING
      - WALKING_DOWNSTAIRS
      - WALKING_UPSTAIRS
- timeDomainBodyAccelerometerMean.X
- timeDomainBodyAccelerometerMean.Y
- timeDomainBodyAccelerometerMean.Z
- timeDomainBodyAccelerometerStandardDeviation.X
- timeDomainBodyAccelerometerStandardDeviation.Y
- timeDomainBodyAccelerometerStandardDeviation.Z
- timeDomainGravityAccelerometerMean.X
- timeDomainGravityAccelerometerMean.Y
- timeDomainGravityAccelerometerMean.Z
- timeDomainGravityAccelerometerStandardDeviation.X
- timeDomainGravityAccelerometerStandardDeviation.Y
- timeDomainGravityAccelerometerStandardDeviation.Z
- timeDomainBodyAccelerometerJerkMean.X
- timeDomainBodyAccelerometerJerkMean.Y
- timeDomainBodyAccelerometerJerkMean.Z
- timeDomainBodyAccelerometerJerkStandardDeviation.X
- timeDomainBodyAccelerometerJerkStandardDeviation.Y
- timeDomainBodyAccelerometerJerkStandardDeviation.Z
- timeDomainBodyGyroscopeMean.X
- timeDomainBodyGyroscopeMean.Y
- timeDomainBodyGyroscopeMean.Z
- timeDomainBodyGyroscopeStandardDeviation.X
- timeDomainBodyGyroscopeStandardDeviation.Y
- timeDomainBodyGyroscopeStandardDeviation.Z
- timeDomainBodyGyroscopeJerkMean.X
- timeDomainBodyGyroscopeJerkMean.Y
- timeDomainBodyGyroscopeJerkMean.Z
- timeDomainBodyGyroscopeJerkStandardDeviation.X
- timeDomainBodyGyroscopeJerkStandardDeviation.Y
- timeDomainBodyGyroscopeJerkStandardDeviation.Z
- timeDomainBodyAccelerometerMagnitudeMean
- timeDomainBodyAccelerometerMagnitudeStandardDeviation
- timeDomainGravityAccelerometerMagnitudeMean
- timeDomainGravityAccelerometerMagnitudeStandardDeviation
- timeDomainBodyAccelerometerJerkMagnitudeMean
- timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation
- timeDomainBodyGyroscopeMagnitudeMean
- timeDomainBodyGyroscopeMagnitudeStandardDeviation
- timeDomainBodyGyroscopeJerkMagnitudeMean
- timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation
- frequencyDomainBodyAccelerometerMean.X
- frequencyDomainBodyAccelerometerMean.Y
- frequencyDomainBodyAccelerometerMean.Z
- frequencyDomainBodyAccelerometerStandardDeviation.X
- frequencyDomainBodyAccelerometerStandardDeviation.Y
- frequencyDomainBodyAccelerometerStandardDeviation.Z
- frequencyDomainBodyAccelerometerMeanFrequency.X
- frequencyDomainBodyAccelerometerMeanFrequency.Y
- frequencyDomainBodyAccelerometerMeanFrequency.Z
- frequencyDomainBodyAccelerometerJerkMean.X
- frequencyDomainBodyAccelerometerJerkMean.Y
- frequencyDomainBodyAccelerometerJerkMean.Z
- frequencyDomainBodyAccelerometerJerkStandardDeviation.X
- frequencyDomainBodyAccelerometerJerkStandardDeviation.Y
- frequencyDomainBodyAccelerometerJerkStandardDeviation.Z
- frequencyDomainBodyAccelerometerJerkMeanFrequency.X
- frequencyDomainBodyAccelerometerJerkMeanFrequency.Y
- frequencyDomainBodyAccelerometerJerkMeanFrequency.Z
- frequencyDomainBodyGyroscopeMean.X
- frequencyDomainBodyGyroscopeMean.Y
- frequencyDomainBodyGyroscopeMean.Z
- frequencyDomainBodyGyroscopeStandardDeviation.X
- frequencyDomainBodyGyroscopeStandardDeviation.Y
- frequencyDomainBodyGyroscopeStandardDeviation.Z
- frequencyDomainBodyGyroscopeMeanFrequency.X
- frequencyDomainBodyGyroscopeMeanFrequency.Y
- frequencyDomainBodyGyroscopeMeanFrequency.Z
- frequencyDomainBodyAccelerometerMagnitudeMean
- frequencyDomainBodyAccelerometerMagnitudeStandardDeviation
- frequencyDomainBodyAccelerometerMagnitudeMeanFrequency
- frequencyDomainBodyAccelerometerJerkMagnitudeMean
- frequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation
- frequencyDomainBodyAccelerometerJerkMagnitudeMeanFrequency
- frequencyDomainBodyGyroscopeMagnitudeMean
- frequencyDomainBodyGyroscopeMagnitudeStandardDeviation
- frequencyDomainBodyGyroscopeMagnitudeMeanFrequency
- frequencyDomainBodyGyroscopeJerkMagnitudeMean
- frequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation
- frequencyDomainBodyGyroscopeJerkMagnitudeMeanFrequency