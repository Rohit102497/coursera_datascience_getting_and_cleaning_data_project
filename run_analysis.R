library(data.table)
# Read activity_labels + features

activity_labels <- read.table("activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])
features <- read.table("features.txt")
features[,2] <- as.character(features[,2])


# Extract only the data on mean and standard deviation from features

features_required <- grep(".*mean.*|.*std", features[,2])
features_required_names <- features[features_required,2]
features_required_names <- gsub("-", "", features_required_names)
features_required_names <- gsub("[()]", "", features_required_names)
features_required_names <- gsub("mean", "Mean", features_required_names)
features_required_names <- gsub("std", "Std", features_required_names)


# Load train and test datasets

train_x <- read.table("train/X_train.txt")
train_y <- read.table("train/Y_train.txt")
train_subject <- read.table("train/subject_train.txt") 
train <- cbind(train_subject,train_y,train_x)

test_x <- read.table("test/X_test.txt")
test_y <- read.table("test/Y_test.txt")
test_subject <- read.table("test/subject_test.txt") 
test <- cbind(test_subject,test_y,test_x)


# Merge train and test datasets to combi

combi <- rbind(train,test)
names(combi) <- c("subject", "activity", features_required_names)


# convert subject and activity of combi to factors

combi$subject <- factor(combi$subject)
combi$activity <- factor(combi$activity, levels = activity_labels[,1], labels = activity_labels[,2])


# Average of each variable for each activity and each subject
combi.melt <- melt(combi, id =1:2)
combi.melt1 <- dcast(combi.melt,subject + activity ~ variable, mean)
combi.melt1 <- combi.melt1[,1:81]

# writing combi.melt1 to tidy text

write.table(combi.melt1,"tidy.txt",row.names = F, quote = F)