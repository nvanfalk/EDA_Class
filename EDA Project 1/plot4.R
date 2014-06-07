################################################################################

# Jon Rogers
# GitHub ID = VanFalk
# Plot 4

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

### !! Code for plots 1 and 3 is not identical to earlier exercises !! ###

# Generate plot 1
plot(x = power$datetime,
     y = power$Global_active_power, 
     ylab = "Global Active Power",
     xlab = "",
     type = "n")
lines(power$datetime, power$Global_active_power, type = "l")

# Generate plot 2
plot(x = power$datetime,
     y = power$Voltage, 
     ylab = "Voltage",
     xlab = "datetime",
     type = "n")
lines(power$datetime, power$Voltage, type = "l")

# Generate plot 3
plot(x = power$datetime,
     y = power$Global_active_power, 
     ylab = "Energy sub metering",
     xlab = "",
     type = "n",
     ylim =c (0, 38))
lines(power$datetime, power$Sub_metering_1, type = "l", col = "black")
lines(power$datetime, power$Sub_metering_2, type = "l", col = "red")
lines(power$datetime, power$Sub_metering_3, type = "l", col = "blue")
legend("topright", 
       lty = 1, lwd = 1, bty="n",
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Generate plot 4
plot(x = power$datetime,
     y = power$Global_reactive_power, 
     ylab = "Global_reactive_power",
     xlab = "datetime",
     type = "n")
lines(power$datetime, power$Global_reactive_power, type = "l")


# Create group plot,send to graphics device and close device
png(file="plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

plot(x = power$datetime,
     y = power$Global_active_power, 
     ylab = "Global Active Power",
     xlab = "",
     type = "n")
lines(power$datetime, power$Global_active_power, type = "l")

plot(x = power$datetime,
     y = power$Voltage, 
     ylab = "Voltage",
     xlab = "datetime",
     type = "n")
lines(power$datetime, power$Voltage, type = "l")

plot(x = power$datetime,
     y = power$Global_active_power, 
     ylab = "Energy sub metering", xlab = "", type = "n", ylim =c (0, 38))
lines(power$datetime, power$Sub_metering_1, type = "l", col = "black")
lines(power$datetime, power$Sub_metering_2, type = "l", col = "red")
lines(power$datetime, power$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, lwd = 1, bty="n", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(x = power$datetime,
     y = power$Global_reactive_power, 
     ylab = "Global_reactive_power",
     xlab = "datetime",
     type = "n")
lines(power$datetime, power$Global_reactive_power, type = "l")

dev.off() 

### ~ END ~ ###