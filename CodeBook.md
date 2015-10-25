# Files

run_analysis.R performs the 5 steps outlines in the course project as follows:

* Step 1. We merge the test and training sets by merging the test and training data for x, y and subjects respectively.

* Step 2. We extract columnindexes for mean and standard deviations and extract data from x accordingly.

* Step 3. We recode y to actual activity labels instead of indices.

* Step 4. Column-bind x, y, subjects to enable aggregation by subject and activity groups

* Step 5. Aggregate means for each variable grouped by activity and subject.

# Variables

* xtrain, xtest, x: training, test, merged measurements.

* ytrain, ytest, y: training, test, merged activity indexes.

* subjecttrain, subjecttest, subject: training, test, merged subject indexes.

* features: actual variable names for the dataset x.

* activities: coding key containing activity index and actual activity names.

* all: merged x, y, subjects.

* averages: desired output, column means of x grouped by subject and activity.


