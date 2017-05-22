# Exploratory Data Analysis Project 1
# Suzanne Farrell | May 21 2017
# Plot 3: [Untitled]

setwd("~/ExData_Plotting1")
library('lubridate')
library('lattice')
library('ggplot2')

# Load Data
# Data used spans from 2007-02-01 -- 2007-02-02
# missing values coded as '?'
energydata <- read.table(file = '/Users/non-work/Downloads/household_power_consumption.txt',
                   sep = ';',
                   header = TRUE,
                   colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric'),
                   na.strings = "?",
                   skip = 66637,
                   nrows = 2880,
                   col.names = c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3'),
)

# Format Date & Time
energydata$Date <- as.Date(energydata$Date,"%d/%m/%Y")
energydata$Time <- strptime(paste(energydata$Date,energydata$Time),"%Y-%m-%d %H:%M:%S")


GAP   = energydata$Global_active_power



# Plot 3 = Line plot
# characteristics: black, red, blue
# title = [none]
# xaxis = THU FRI SAT
# yaxis = submetering (all 3)
plot(energydata$Time,energydata$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering" )
lines(energydata$Time,energydata$Sub_metering_2, col = "red")
lines(energydata$Time,energydata$Sub_metering_3, col = "blue")
legend('topright',legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = c(1,1,1))

dev.copy(png,'plot3.png',width = 480, height = 480,bg="transparent")
dev.off()