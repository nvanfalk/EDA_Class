################################################################################

# Jon Rogers
# GitHub ID = VanFalk
# Plot 2

################################################################################

# Set working directory and import data and load libraries
setwd("~/Google Drive/JHU Data Science/4 Exploratory Data Analysis/Project 1")
library(data.table)
library("lubridate")

# Import data
data <- fread("household_power_consumption.txt")

# Reformat Date column to subset on
data$Date <- as.Date(data$Date,  format = "%d/%m/%Y")

# Generate new data table based on subset of data 
power <- data[data$Date == "2007-02-02" | data$Date == "2007-02-01", ]

# Format dates and combine Date and Time into a variable
power$datetime <- ymd_hms(paste(power$Date, power$Time, sep = "_")) 

# Create line plot
plot(x = power$datetime,
     y = power$Global_active_power, 
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "n")
lines(power$datetime, power$Global_active_power, type = "l")

# Send plot to graphics device and close device
png(file="plot2.png", width = 480, height = 480)
plot(x = power$datetime,
     y = power$Global_active_power, 
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "n")
lines(power$datetime, power$Global_active_power, type = "l")

dev.off() 

### ~ END ~ ###