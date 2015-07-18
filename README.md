# DataCleaning
ProgrammingAssignment of data cleaning

The program run_analysis.R needs no argument, the file names are hard coded in the code. In order to work it is assumed that the working directory is changed, so that the working directory contains the following files / directories
activity_labels.txt
features.txt
test
  subject_test.txt
  X_test.txt
  y_test
train
  subject_train.txt
  X_train.txt
  y_train.txt

Additionally the data.table package is required. Thus call library(data.table) before calling run_analysis()

As result a file tidyData.txt is generated in the working directory. 

Have fun
  
  
