### Requirements

The data is provided in a [ZIP file] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

This file should be unzipped directly in the current working directory.

After that, there should be a *UCI HAR Dataset* folder in the current working directory, containing all needed data (see README.txt in the folder for more information).

### CodeBook

The CodeBook.md file describes:
- the conditions of the experiment done by the researchers at the *Smartlab* laboratory of the *Università degli Studi di Genova*, in Genoa (Italy)
- the data gathered during the experiment, the data derived from the measurements and the features calculated from these data
- the way these data are provided in the ZIP file
- what are the data actually needed to fulfill our project and how the provided raw data have been processed to get a final tidy data

### R code

The run_analysis.R file contains the R code necessary to:
- import the raw data
- process the data
- export the final tidy data

This code is fully commented and strictly follows the description of the data processing of the CodeBook. It can be executed (given that the requirements above are fulfilled) to reproduce the creation of a tidy data set for further use.