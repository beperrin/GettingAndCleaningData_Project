# A. Conditions of the experiment

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

The experiments have been video-recorded to label the data manually. 

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

# B. Data gathered, derived and calculated during the experiment

## B1. Raw signals

Using the smartphone's embedded accelerometer and gyroscope, two types of signals have been captured at a constant rate of 50Hz:
- 3-axial linear acceleration (captured by accelerometer)
- 3-axial angular velocity (captured by gyroscope)

These time domain signals were captured at a constant rate of 50 Hz. 

## B2. Pre-processed signals

These sensor signals have been pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap. There are 128 readings per window for each signal. 

Then they have been filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 

The sensor acceleration signal, which has gravitational and body motion components, has been separated into:
- body acceleration signals *tBodyAcc-XYZ* 
- and gravity signals *tGravityAcc-XYZ*

The gravitational force is assumed to have only low frequency components, therefore a Butterworth low-pass filter with 0.3 Hz cutoff frequency has been used. 

The sensor gyroscope signals are *tBodyGyro-XYZ*

One should notice that the prefix "t" denotes time domain signals. 
Moreover, "-XYZ" is used to denote 3-axial signals in the X, Y and Z directions.

## B3. Additional derived signals

The body linear acceleration and angular velocity have been derived in time to obtain Jerk signals: *tBodyAccJerk-XYZ* and *tBodyGyroJerk-XYZ*.

The magnitude of these three-dimensional signals have been calculated using the Euclidean norm: *tBodyAccMag*, *tGravityAccMag*, *tBodyAccJerkMag*, *tBodyGyroMag*, *tBodyGyroJerkMag*. 

Finally a Fast Fourier Transform (FFT) has been applied to some of these signals producing: *fBodyAcc-XYZ*, *fBodyAccJerk-XYZ*, *fBodyGyro-XYZ*, *fBodyAccJerkMag*, *fBodyGyroMag*, *fBodyGyroJerkMag*. 
One should notice that the prefix "f" denotes frequency domain signals. 

## B4. Summary of recorded and derived signals

A total of 33 signals have been either captured and processed or derived from captured signals.

### i. Measured and pre-processed signals 

Acceleration: 6 time domain signals
- *tBodyAcc-XYZ*
- *tGravityAcc-XYZ*

Gyroscope: 3 time domain signals
- *tBodyGyro-XYZ*

### ii. Derived signals

Jerk signals for body acceleration and gyroscope signals: 6 time domain signals
- *tBodyAccJerk-XYZ*
- *tBodyGyroJerk-XYZ*

Magnitudes of all 5 previous signals: 5 time domain signals
- *tBodyAccMag*
- *tGravityAccMag*
- *tBodyGyroMag*
- *tBodyAccJerkMag* 
- *tBodyGyroJerkMag*

FFT applied to some of the previous signals: 13 frequency domain signals
- *fBodyAcc-XYZ*
- *fBodyGyro-XYZ*
- *fBodyAccJerk-XYZ*
- *fBodyAccMag*
- *fBodyGyroMag*
- *fBodyAccJerkMag*
- *fBodyGyroJerkMag*

## B5. Calculated features

For each 2.56 sec window and each of the 33 previously described measured or derived signals, a total of 128 points of measurement have been produced. 

Some variables have been estimated on these signals measurements.

### i. Variables estimated for both time domain and frequency domain signals 
- *mean()*: Mean value of the signal on the window frame
- *std()*: Standard deviation
- *mad()*: Median absolute deviation 
- *max()*: Largest value 
- *min()*: Smallest value 
- *sma()*: Signal magnitude area
- *energy()*: Energy measure (sum of the squares divided by the number of values) 
- *iqr()*: Interquartile range 
- *entropy()*: Signal entropy
- *arCoeff()*: Autorregresion coefficients with Burg order equal to 4
- *correlation()*: Correlation coefficient (between two directions for 3-axis signals)

### ii. Variables estimated for frequency domain signals only
- *maxInds()*: index of the frequency component with largest magnitude
- *meanFreq()*: Weighted average of the frequency components to obtain a mean frequency
- *skewness()*: skewness of the frequency domain signal 
- *kurtosis()*: kurtosis of the frequency domain signal 
- *bandsEnergy()*: Energy of a frequency interval within the 64 bins of the FFT of each window.

### iii. Specific additional variables estimated on a subset of signals
The *angle()* variable corresponds to the average of the following signals in all directions in the window sample: *gravityMean*, *tBodyAccMean*, *tBodyAccJerkMean*, *tBodyGyroMean*, *tBodyGyroJerkMean*

### iv. Summary of calculated features
The estimate of 1 variable on the 128 measurements of 1 type of signal on 1 window is called a feature.

561 features have been calculated for each window. As previously said, not all variables are calculated on all 17 signals. Moreover, some signals result in more than 1 feature (*bandsEnergy* and *correlation*)

Features have been normalized and bounded within [-1,1].

# C. Data provided

Each record in the dataset corresponds to one specific window sample of one particular subject (1 out of 30) performing one specific activity (1 out of 6 activities). 

For each record in the dataset the following data are provided: 

## C1. The subject recorded

An identifier of the subject who carried out the experiment is provided in the files 
*train/subject_train.txt* and *test/subject_test.txt*.

Each row identifies the subject who performed the activity for the corresponding window sample. Its range is from 1 to 30. 

## C2. The activity performed

Activity codes are provided in the files *train/y_train.txt* and *test/y_test.txt* for training and test sets respectively.

Each row identifies the activity performed by the subject for the corresponding window sample. Its range is from 1 to 6.

One should notice that the file *activity_labels.txt* enables to match these activity codes with their plain name (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

## C3. The inertial signals 

The inertial signals correspond to previously described pre-processed signals:
- accelerometer signal: total acceleration and the relative estimated body acceleration 
- gyroscope signal

Each record corresponds to a 128 element vector since for each fixed-width sliding window of 2.56 sec, a total of 128 measures have been taken.

Triaxial total acceleration signal from the accelerometer in standard gravity units 'g' are provided in the following files:
- X axis: *train/Inertial Signals/total_acc_x_train.txt* and *test/Inertial Signals/total_acc_x_train.txt* for train and test sets respectively
- Analogue for Y and Z axis

Triaxial estimated body acceleration obtained by subtracting the gravity from the total acceleration: 
- X axis: *train/Inertial Signals/body_acc_x_train.txt* and *test/Inertial Signals/body_acc_x_train.txt* for train and test sets respectively
- Analogue for Y and Z axis

Triaxial Angular velocity from the gyroscope in radians/second: 
- X axis: *train/Inertial Signals/body_gyro_x_train.txt* and *train/Inertial Signals/body_gyro_x_train.txt*  
- Analogue for Y and Z axis

In totality there are 128 * (3 * 3) = 1152 measurements of inertial signals provided for each record.

## C4. Time and frequency domain features

For each record, 561 features have been calculated as previously explained (cf. B5 iv)

Data are provided in *train/X_train.txt* and *test/X_test.txt* for testing and test sets respectively.

The list of all features of this 561-features vector is provided in the file *features.txt*. One should notice that this file is not perfect because names are not syntactically valid for naming columns in a correct database. Moreover, some errors have been made in the naming. This is discussed in the **Data processing** part of this CodeBook.

In total, there are 1 + 1 + 1152 + 561 = 1715 "measurements" available for each record.

One should notice that there are no indices relative to each record. But it is obvious that all files provided refer to the same records ordering.

# D. Data processing

## D1. What kind of data do we actually need?

For each record we need to gather the following data:
- subject recorded (1 value for each record)
- activity performed (idem)
- mean and standard deviations estimated over the 128 measurements (for the particular windows) of every single signal measured or derived. In the B4 part a total of 33 signals have been described. We hence will extract 33 means and 33 standard deviations, that is a total of 66 features for each record. A quick look at the *features.txt* file confirms that by looking for the *mean()* and *std()* strings we get 66 occurences.

We hence don't need: 
- all other features resulting from other than mean and std variables estimated on the signals (for example the maximum value of the signal in the recording window, its minimum value, its energy value, its iqr value, its entropy value, the kurtosis value for a derived frequency domain signal, etc.): this corresponds to 561 - 66 = 495 features we do not keep 
- the inertial signals values (9 signals * 128 measurements for each record = 1152) 

Because of this "filtering" of information, we will have only 1+1+66 = 68 features in the resulting data frame (before transforming it into tidy data) instead of 1715.

In terms of lines, we need to create one unique data set containing all records of both training and testing sets.

## D2. How do we proceed?

### i. Read files

Read csv files for training and test
- Read *subject_train.txt* -> *subject.train* vector
- Read *y_train.txt* -> *num.activity.train* vector
- Read *X_train.txt* -> *features.train* matrix
- Read *subject_test.txt* -> *subject.test* vector
- Read *y_test.txt* -> *num.activity.test* vector
- Read *X_test.txt* -> *features.test* matrix
- Read *features.txt* -> *features* characters vector whose length is 561
- Read *activity_labels.txt* -> *matching.activity* data frame

Check that the train objects have the same number of lines (corresponding to the number of records in the train set). Idem for the test objects. 

Check that there are 561 columns both for *features.train* and *features.test* data frames. Check also that the length of the *features* vector is 561. 

NA values will be studied later.

### ii. Select needed features

We use the *grepl()* function on the *features* vector to look for *mean()* and *std()* strings and return a logical string with the columns to keep for further use.

We use this logical vector to subset in the *features.train* and *features.test* matrix the corresponding columns: we obtain *sel.features.train* and *sel.features.test* matrices with only 66 columns (but the same number of rows).

We use also this logical vector to subset the interesting features names from the *features* vector and obtain a *sel.features* vector whose length is 66 and contains the names of the features kept.

### iii. Transform activity numeric vectors into characters factors.

Using the *sapply()* function and the *matching.activity* data frame, we create *activity.train* and *activity.test* vectors containing plain names of activity for each record and then transform them into factors.

### iv. Create training and test data frames

Using *cbind()* function, we append *subject.train* and *activity.train* vectors to *sel.features.train* matrix and obtain *data.train* data frame with 68 columns.

We do a similar treatment for test data obtaining the *data.test* data frame.

### v. Rename columns properly

We use the *make.names()* base function on the *sel.features* vector to make the features names syntactically correct: we obtain the *syntcorr.sel.features* vector.

We get rid of what is still unappropriate in terms of naming using *gsub*.

Using the *c()* function, we append this vector with the strings "subject" and "activity" to obtain a 68-length vector *data.col.names*.

We change the names of the columns of the *data.train* and *data.test* data frames using this vector and the *colnames()* function.

### vi. Append train and test data

Using *rbind()* function, we append *data.train* and *data.test* data frames and obtain the *data* data frame which contains all records and interesting features (68 columns).

At this step we have a proper data frame, which is not yet tidy.

We check for major features and check that no NA is present in the data frame.

### vii. Extract the averages and transform into a tidy data set

We will use the *melt()* and *dcast()* functions of the *reshape2* R library.

We first melt the *data* data frame keeping *subject* and *activity* as *IDs* and all other 66 features as *variables*. We obtain a *melted.data* data frame.

Then we cast this melted data frame with the *mean* function to obtain the final *tidy.data* data set.

What we get is the average value for each couple {subject, activity} of the 66 selected features (mean and standard deviation of all 33 measured and derived signals).

Having 30 subjects, 6 activites and 66 features, we finally get a 180 x 68 tidy data set.

We export this data set in a file using *write.table()*.

What we could do with this data (but it is out of scope of this project), is looking for patterns, for example:
- what is the standard deviation for each of these features averages among the different subjects for each activity?
- are we able to predict correctly the activity performed by someone just looking at some of these features?