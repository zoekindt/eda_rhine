# ============================================================
# EDA in Geosciences - Assignment 3
# Updating, Adding & Deleting Variables with data.table
# ============================================================

library(data.table)

# load the built-in airquality dataset
air <- as.data.table(airquality)

# quick look at the data
head(air)

# Task 1 - convert Wind from mph to km/h (1 mph = 1.6 km/h)
air[, Wind := Wind * 1.6]
head(air)

# Task 2 - create a new column called chill (Wind * Temp)
air[, chill := Wind * Temp]
head(air)

# Task 3 - calculate average chill per month and add it as a new column
air[, avg_chill := mean(chill), by = Month]
head(air)

# Task 4 - remove the Ozone and Solar.R columns
air[, c("Ozone", "Solar.R") := NULL]
head(air)
