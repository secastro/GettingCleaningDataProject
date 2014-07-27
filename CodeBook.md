# Course Project CodeBook

## Overview

This CodeBook describes the process and reasoning behind converting the
"Human Activity Recognition Using Smartphones Data Set" located
originally at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
into a tidy dataset that contains an average per subject, activity and
feature describing a mean.

## Introduction

### Original dataset

The UCI HAR dataset is a set of recordings of 30 subjects doing 6
different activities while wearing an smartphone. Using the
smartphones accelerometer and gyroscope, the linear acceleration and
angular velocity was captured in 3 axis, at a constant rate of 50 Hz.

For extended details, please refer to the README.txt file included in
the dataset.

The dataset includes the following files in the main root directory:
* activity_labels.txt: one line per activity, containing a number and a
  description of the activity
* features_info.txt: Contains the methodology used to generate set of
  variables calculated from the raw data collected. 
* features.txt: a 561-line file, with each line representing an index
  and a name for the variable. The general structure of each variable
  is: <domain><variable>-<function>-<axis>. For example,
  "tBodyAcc-min()-Y" represents the 't' time domain, for 'Body
  Acceleration', minimum function in the Y-axis.

The dataset was originally splitted in 'test' and 'train' dataset (so
the value **subset** below can be 'test' or 'train'), each on their own
directory, with the following structure

- **subset**/Inertial Signals: The original raw data registered by the
  sensors.
- **subset**/subject_**subset**.txt: List of ids of each subject. The lines
  matches the number of lines in X_**subset**.txt and y_**subset**.txt
- **subset**/X_**subset**.txt: Contains one column per feature (561 rows),
  and one line per matching line on the file above.
- **subset**/y_**subset**.txt: Contains one line with a number indicating
  the activity being. The number matches the activities included in the
  *activity_labels.txt* file. The number of lines matches the lines in
  both file above.

### Transformation process

The script 'run_analysis.R' will read the dataset and apply the
following transformations:

1. Read the list of activity labels from the 'activity_labels.txt' file.
2. Read the list of features from the 'features.txt' file
3. Because we are only interested in the features that represent a
'mean' or 'standard deviation' (std for short), and given the features
have a name representing the type of function applied, we filter them by
the name. In specific, I decided to keep all features with a name that
contains 'mean()' or 'std()'. A character vector was created with the
values 'numeric' or 'NULL', if a feature name matches the filter, the
corresponding character element contains 'numeric', if not, contains
'NULL'. This helps to discard those columns we are not interested on on
read.
4. Once the features are selected, some cleaning is done. The '()'
string is removed, and '-' (dash) is replaced by '_' (underscore) to
avoid generating unclear column names. Also there is a few variables
with a repetition of the string 'Body', in which case only one instance
is preserved.
5. Because the 'train' and 'test' dataset share a common structure, the
function 'read_dataset' was created to simplify the process. This
function receives the name of the dataset ('train' or 'test'), the name
of the feature on each column (to assign column names on read), and the
vector of column class, so the undesired columns are discarded on read.
6. The 'test' and 'train' subset are merged in one dataset using rbind
7. The original instructions required to replace the activity_id on the
dataset for 'meaningful names', so the full dataset is merged with the
activity labels read on step 1, and the activity_id column is discarded.
8. Calculate the average of each column, grouped by subject id and
activity label.
9. Rename the columns of the tidy dataset to include the prefix 'avg_'
for reflect their true meaning.
10. Final step, save the tidy dataset in a file for sharing.

### Notes to the user
Execution notes are included in the README.md file
