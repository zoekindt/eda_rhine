# ============================================================
# EDA in Geosciences - Assignment 2
# Summarizing, Counts & Group By with data.table
# ============================================================

library(data.table)

# load the built-in airquality dataset
air <- as.data.table(airquality)

# quick look at the data
head(air)

# Task 1 - count how many days are in each month
task1 <- air[, .N, by = Month]
task1

# Task 2 - average wind speed per month, only for days that have an ozone reading
task2 <- air[!is.na(Ozone), .(avg_wind = mean(Wind)), by = Month]
task2

# Task 3 - mean temperature for odd and even days, grouped by month
task3 <- air[, .(mean_temp = mean(Temp)),
             by = .(Month, odd_even = ifelse(Day %% 2 == 0, "even", "odd"))]
task3
