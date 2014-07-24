# Helper scripts
source("read_dataset.R")

# Get into the directory with data
setwd('UCI HAR Dataset')

# First part, read the files that contain labels for activities
activity_label <- read.table('activity_labels.txt', sep=" ",
header=FALSE, col.names=c('id', 'name'), stringsAsFactors=FALSE,
colClasses=c('integer','factor'))

# Second, read the description for the features
features <- read.table('features.txt', sep=" ",
header=FALSE, col.names=c('id', 'name'), stringsAsFactors=FALSE,
colClasses=c('integer', 'character'))

# Add column 'wanted' to features with a TRUE/FALSE value if it's a feature we
# want to extract
features$wanted <- grepl('(mean|std)\\(\\)', features$name)

# Add column 'col_class' to features to indicate the class of the column
# to be read from the dataset. We are expecting numeric, but those
# unwanted columns will have a 'NULL' and be discarded on read
features$col_class <- sapply(features$wanted, function(elem) ifelse(elem, 'numeric', 'NULL'))

# Alter the names of the features a little bit to produce readable
# labels for the columns. Eliminate () and replace '-' by '_'
features$name <- gsub("\\(\\)", "", features$name)
features$name <- gsub("-", "_", features$name)

# Build the test dataset
data_test <- read_dataset('test', features$name, features$col_class)

# Build the train dataset
data_train <- read_dataset('train', features$name, features$col_class)

# Merge the test and train dataset
full_dataset <- rbind(data_test, data_train)

# NOTE: No need to sort it yet

# Merge full_dataset and activity_label to get 

# Calculate the average of each variable/activity/subject tuple
