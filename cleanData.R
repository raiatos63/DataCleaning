cleanData <- function()
{
# It is assumed that the working directory is set so that the 
# feature description is directly in the working directory and the 
# training and test signals are in the directories "train" and "test"

#Load the names
feature_names <- read.table("features.txt")
feature_names <- feature_names[,2]

#Load the activities
activities <- read.table("./activity_labels.txt")

#Load the training signals
train_data <- read.table("./train/X_train.txt")
colnames(train_data) <- feature_names



#Load the training activities
train_act <- read.table("./train/y_train.txt")
for (i in 1:6) {
	index <- train_act == activities[i,1];
	train_act <- replace(train_act,index,toString(activities[i,2]))
}

#Add the training activities to the data frame
train_data['activity'] <- train_act

#Read the person-id of the training-data
person_id <- read.table("./train/subject_train.txt")
#Add the person-id to the training data
train_data['person_id'] <- person_id


#Load the test data
test_data <- read.table("./test/X_test.txt")
colnames(test_data) <- feature_names

 #Load the test activities
test_act <- read.table("./test/y_test.txt")
for (i in 1:6) {
	index <- test_act == activities[i,1];
	test_act <- replace(test_act,index,toString(activities[i,2]))
}

#Add the training activities to the data frame
test_data['activity'] <- test_act

#Read the person-id of the training-data
person_id <- read.table("./test/subject_test.txt")
#Add the person-id to the training data
test_data['person_id'] <- person_id

#Put both data_sets together
test_data <- rbind(test_data,train_data)

#Look only for standard_deviation, mean, person_id and activity
indexvec <- grepl("std()",names(test_data)) | grepl("mean()",names(test_data)) 
indexvec <- indexvec | grepl("person_id",names(test_data)) | grepl("activity",names(test_data))

#Throw away colums which does not contain std, mean, person, ..
test_data <- test_data[,indexvec]

#Calculate the mean of all attributes grouped by person_id and activity
result <- dattab[,lapply(.SD,mean),by=c("person_id","activity")]

write.table(result,"tidyData.txt",row.name=FALSE)
}