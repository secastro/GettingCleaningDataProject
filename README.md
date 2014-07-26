## INTRODUCTION

This is the code to complete the Getting and Cleaning Data Course
Project.

The objective of the Course Project is to manipulate the _Human Activity
Recognition Using Smartphones Data Set_
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
to produce a tidy data set containing the average of all features
grouped by subject and activity


## INSTRUCTIONS

To generate the tidy dataset, follow the steps below (assuming you are
running Mac/Linux)
1. Download the input dataset
```
wget -q https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
```
2. Unzip the file downloaded
```
unzip 'getdata%2Fprojectfiles%2FUCI HAR Dataset.zip'
```
3. Run the *run_analysis.R* script
```
R -f run_analysis.R
```

The file *Course.Project-Tidy.Dataset.txt* will be created by the
script, and it will contain the tidy dataset.

## Dependencies
The *run_analysis.R* script requires the file *read_dataset.R*, which
implements a function to read a given dataset (train or test, for
example)
