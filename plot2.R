# Exploratory Data Analysis Project 1
# Suzanne Farrell | May 21 2017
# Plot 2: [Untitled]

setwd("~/ExData_Plotting1")
library('lubridate')
library('lattice')
library('ggplot2')

# Load Data
# Data used spans from 2007-02-01 -- 2007-02-02
# missing values coded as '?'
data <- read.table(file = '/Users/non-work/Downloads/household_power_consumption.txt',
                   sep = ';',
                   header = TRUE,
                   colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric'),
                   na.strings = "?",
                   skip = 66637,
                   nrows = 2880,
                   col.names = c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3'),
)

# Format Date & Time
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Time <- strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")


GAP   = data$Global_active_power
wkday = factor(weekdays(data$Time,abbreviate = TRUE),levels = c('Thu','Fri','Sat'))


# Plot 2 = Line plot
# characteristics: black
# title = [none]
# xaxis = THU FRI SAT
# yaxis = Global Active Power (kilowatts)
par(mfcol = c(1,1), mfrow = c(1,1))

plot(data$Time,GAP,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.copy(png,'plot2.png',width = 480, height = 480,bg="transparent")
dev.off()