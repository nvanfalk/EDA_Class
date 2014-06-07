################################################################################

# Jon Rogers
# GitHub ID = VanFalk
# Plot 1

################################################################################

# Load libraries and set working directory
library(data.table)
setwd("~/Google Drive/JHU Data Science/4 Exploratory Data Analysis/Project 1")

# Import data
data <- fread("household_power_consumption.txt")

# Reformat Date column to subset on
data$Date <- as.Date(data$Date,  format = "%d/%m/%Y")

# Generate new data table based on subset of data 
power <- data[data$Date == "2007-02-02" | data$Date == "2007-02-01", ]

# Generte histogram of Gloabal Active Power
hist(as.numeric(power$Global_active_power), 
     col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

# Send plot to graphics device and close device
png(file="plot1.png", width = 480, height = 480)
hist(as.numeric(power$Global_active_power), 
     col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power") 
dev.off() 

### ~ END ~ ###