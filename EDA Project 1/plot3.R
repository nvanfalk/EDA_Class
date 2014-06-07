################################################################################

# Jon Rogers
# GitHub ID = VanFalk
# Plot 3

################################################################################

# Set working directory and load libraries
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
     ylab = "Energy sub metering",
     xlab = "",
     type = "n",
     ylim =c (0, 40))

lines(power$datetime, power$Sub_metering_1, type = "l", col = "black")
lines(power$datetime, power$Sub_metering_2, type = "l", col = "red")
lines(power$datetime, power$Sub_metering_3, type = "l", col = "blue")

legend("topright", 
       lty = 1, lwd = 1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Send plot to graphics device and close device
png(file="plot3.png", width = 480, height = 480)

plot(x = power$datetime,
     y = power$Global_active_power, 
     ylab = "Energy sub metering",
     xlab = "",
     type = "n",
     ylim =c (0, 40))

lines(power$datetime, power$Sub_metering_1, type = "l", col = "black")
lines(power$datetime, power$Sub_metering_2, type = "l", col = "red")
lines(power$datetime, power$Sub_metering_3, type = "l", col = "blue")

legend("topright", 
       lty = 1, lwd = 1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off() 

### ~ END ~ ###