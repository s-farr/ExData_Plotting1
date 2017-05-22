# Exploratory Data Analysis Project 1
# Suzanne Farrell | May 21 2017
# Plot 4: [Untitled]


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

GAP = energydata$Global_active_power


# Plot 4 = 4-sub plots
par(mfcol = c(2,2), mfrow = c(2,2))

# Sub plot 1: Global Active Power vs. wkday (i.e. plot 1)
# title = [none]
# xaxis = THU FRI SAT
# yaxis = Global Active Power
plot(energydata$Time,GAP,
     type = 'l',
     xlab = "",
     ylab= "Global Active Power")


# Sub plot 2: Voltage vs. datetime
# title = [none]
# xaxis = THU FRI SAT | datetime
# yaxis = voltage
with(energydata,plot(Time,Voltage,
        type = 'l',
        xlab = "datetime",
        ylab= "Voltage"),
)



# subplot 3: energy sub metering vs wkday (i.e plot 3)
# title = [none]
# xaxis = THU FRI SAT | datetime
# yaxis = Energy sub metering 
# with legend
with(energydata,plot(Time,Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering" ) )

lines(energydata$Time,energydata$Sub_metering_2, col = "red")
lines(energydata$Time,energydata$Sub_metering_3, col = "blue")
legend('topright',legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n",
       col = c("black", "red", "blue"), lty = c(1,1,1))



# suplot 4: global reactive power vs. datetime
# title = []
# xaxis = THU FRI SAT | datetime
# yaxis = Global_reactive_power
with(energydata,plot(Time,Global_reactive_power,
                     type = "l",
                     xlab = "datetime") )

# PNG - width of 480 pixels and a height of 480 pixels
dev.copy(png,'plot4.png',width = 480, height = 480,bg="transparent")

dev.off()