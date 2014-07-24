# Function read_dataset
# Given a type of dataset (actually expecting test or training), will
# read the dataset and return a data frame 
read_dataset <- function(type) {
    setwd(type)
    subject <- read.table(sprintf('subject_%s.txt', type), sep=" ",
        header=FALSE, col.names=c('subject_id'), stringsAsFactors=FALSE,
        colClasses=c('integer'))

    features <- read.table(sprintf('X_%s.txt', type),
        col.names=features$name)

    activity <- read.table(sprintf('y_%s.txt', type),
        col.names=c('activity_id'), colClasses=c('integer'))

    # Merge the datasets in one data frame
    df <- cbind(subject, activity, features)

    # Return to the directory where we started
    setwd('..')

    # Return the data frame
    df
}
