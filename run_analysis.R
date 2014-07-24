# Get into the directory with data
setwd('UCI HAR Dataset')

# First part, read the files that contain labels for activities
activities <- read.table('activity_labels.txt', sep=" ",
header=FALSE, col.names=c('id', 'name'), stringsAsFactors=FALSE,
colClasses=c('integer','character'))

# Second, read the description for the features
features <- read.table('features.txt', sep=" ",
header=FALSE, col.names=c('id', 'name'), stringsAsFactors=FALSE,
colClasses=c('integer', 'character'))

# Build the test dataset
setwd('test')
subject_test <- read.table('subject_test.txt', sep=" ", header=FALSE,
col.names=c('subject_id'), stringsAsFactors=FALSE,
colClasses=c('integer'))

features_test <- read.table('X_test.txt', col.names=features$name)

activity_test <- read.table('y_test.txt', col.names=c('activity_id'), colClasses=c('integer'))

# Merge the test datasets in one data frame
data_test <- cbind(subject_test, activity_test, features_test)
setwd('../..')
