# setwd("/Users/beperrin/Documents/Dataviz/Coursera/Getting and Cleaning Data/Project")

library(reshape2)

# i. Read files

# Read csv files for training and test

subject.train <- read.table("UCI HAR Dataset/train/subject_train.txt", header= FALSE)
num.activity.train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
features.train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)

subject.test <- read.table("UCI HAR Dataset/test/subject_test.txt", header= FALSE)
num.activity.test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
features.test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)

features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)
features <- as.character(features[,2])

matching.activity <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

# Check number of records and number of features

nrow(subject.train)
nrow(num.activity.train)
nrow(features.train)
# There are 7352 records in the train set

nrow(subject.test)
nrow(num.activity.test)
nrow(features.test)
# There are 2947 records in the test set

ncol(features.train)
ncol(features.test)
length(features)
# There are 561 features


# ii. Select needed features

log.vec <- grepl("mean()", features, fixed = TRUE) | grepl("std()", features, fixed = TRUE)
sum(log.vec)
# There are 66 strings containing either mean() or std(), as expected.

sel.features.train <- features.train[,log.vec]
sel.features.test <- features.test[,log.vec]
# We select only interesting features (66 out of 561)

sel.features <- features[log.vec]
# We select their name (will transform them later)


# iii. Transform activity numeric vectors into characters factors

activity.train <- as.factor(sapply(num.activity.train, f <- function(num) matching.activity[num,2]))
activity.test <- as.factor(sapply(num.activity.test, f <- function(num) matching.activity[num,2]))


# iv. Create training and test data frames

data.train <- cbind(subject.train, activity.train, sel.features.train)
data.test <- cbind(subject.test, activity.test, sel.features.test)


# v. Rename columns properly

syntcorr.sel.features <- make.names(sel.features)
# This standard function makes syntactically valid names out of character vectors

syntcorr.sel.features <- gsub(".","",syntcorr.sel.features, fixed = TRUE)
syntcorr.sel.features <- gsub("mean","Mean",syntcorr.sel.features, fixed = TRUE)
syntcorr.sel.features <- gsub("std","Std",syntcorr.sel.features, fixed = TRUE)
# We get rid of dots, and a capital letters to "mean" and "std" strings

data.col.names <- c("subject", "activity", syntcorr.sel.features)
colnames(data.train) <- data.col.names
colnames(data.test) <- data.col.names
# We rename columns properly

# vi. Append train and test data

data <- rbind(data.train, data.test)
# We can simply use rbind because columns names are strictly identical

# At this step we have a proper data frame, which is not yet tidy.

summary(data)
# We check some features of the data frame

sum(sapply(1:68, f <- function(col) sum(is.na(data[,col]))))
# There is no NA in our data frame


# vii. Extract the averages and transform into a tidy data set

melted.data <- melt(data, id=1:2, measure.vars = 3:68)
# We melt the data frame keeping subject and activity as IDs and all other 66 features as variables
tidy.data <- dcast(melted.data, subject + activity ~ variable, mean)
# Then we cast this melted data frame with the mean function to get the averages of each feature for each {subject, activity} pair

write.table(tidy.data, file = "tidydataset.txt")
# We export the tidy data set
