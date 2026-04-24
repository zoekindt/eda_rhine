# ============================================================
# EDA in Geosciences - Assignment 4
# Joining Datasets & Chaining with data.table
# ============================================================

library(data.table)

# load the built-in airquality dataset
air <- as.data.table(airquality)

# create a small lookup table with month names and abbreviations
airmonths <- data.table(
  Month      = 5:9,
  month_name = c("May", "June", "July", "August", "September"),
  month_abbr = c("May", "Jun", "Jul", "Aug", "Sep")
)

# quick look at both tables
head(air)
airmonths

# Task 1 - join to add the month name to air
air[airmonths, on = .(Month), month_name := i.month_name]
head(air)

# Task 2 - join to add both month name and abbreviation
air[airmonths, on = .(Month),
    `:=` (month_name = i.month_name,
          month_abbr = i.month_abbr)]
head(air)

# Task 3 - fresh start, then join + chain to get median wind per month name
air <- as.data.table(airquality)

task3 <- air[airmonths, on = .(Month), month_name := i.month_name
             ][, .(median_wind = median(Wind)), by = month_name]
task3
