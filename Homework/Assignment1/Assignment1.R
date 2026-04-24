# ============================================================
# EDA in Geosciences - Assignment 1
# Topic: Filtering Rows & Selecting Columns with data.table
# Dataset: airquality (built-in R dataset)
# ============================================================

library(data.table)

# Load the airquality dataset and convert to data.table
air <- as.data.table(airquality)

# Inspect the data
head(air)
str(air)

# -----------------------------------------------
# Task 1: Subset rows
# Get only the rows with a Day lower than or equal to 10
# -----------------------------------------------

task1 <- air[Day <= 10, ]
task1

# -----------------------------------------------
# Task 2: Select columns
# Select only the Month column and make sure you get a data.table back
# -----------------------------------------------

task2 <- air[, .(Month)]
task2

# -----------------------------------------------
# Task 3: Subset rows & select columns
# Get only the Wind & Temp columns for the rows
# with a Day higher than 5 and lower than or equal to 10
# -----------------------------------------------

task3 <- air[Day > 5 & Day <= 10, .(Wind, Temp)]
task3
