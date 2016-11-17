# Getting-and-Cleaning-Data-Course-Project

This is a repository for any and all code written for the Getting and Cleaning Data Coursera course through Johns Hopkins University.

Course Project

(find all project-related materials in the UCI HAR Dataset directory, however, copies of the important files have been put into this main directory to fulfill the submission requirement)

Unzip the source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder on your local drive, say C:\Users\yourname\Documents\R\

Put run_analysis.R into C:\Users\yourname\Documents\R\UCI HAR Dataset\

In RStudio: setwd("C:\\Users\\yourname\\Documents\\R\\UCI HAR Dataset\\"), followed by: source("run_analysis.R")

Use data <- read.table("merged_tidy_with_averages.txt") to read the data. It is 180x68 because there are 30 subjects and 6 activities
