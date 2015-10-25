library(plyr)

# 1
#######################

xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")
subjecttrain <- read.table("train/subject_train.txt")

xtest <- read.table("test/X_test.txt")
ytest <- read.table("test/y_test.txt")
subjecttest <- read.table("test/subject_test.txt")

x <- rbind(xtrain, xtest)
y <- rbind(ytrain, ytest)
subject <- rbind(subjecttrain, subjecttest)

# 2
#######################

features <- read.table("features.txt")

# get columnindex of mean and standard deviation features, get corresponding columns from x
meanstd <- grep("-(mean|std)\\(\\)", features[, 2])
x <- x[, meanstd]
names(x) <- features[meanstd, 2]

# 3
#######################

activities <- read.table("activity_labels.txt")

#update activity labels
y[, 1] <- activities[y[, 1], 2]
names(y) <- "activity"

# 4
########################

names(subject) <- "subject"
all <- cbind(x, y, subject)

# 5
########################

#calculate columnmeans grouped by subject and activity
averages <- ddply(all, .(subject, activity), function(x) colMeans(x[, 1:(length(x)-2)]))
write.table(averages, "averages_data.txt", row.name=FALSE)

