## setwd("~/Workspace/Coursera/Exploratory_Data_Analysis/ExData_Plotting1")

## Loading the data and replace '?' with NA
raw_data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
working_data <- raw_data

## Combining two factors $Date and $Time, convert to POSIXlt class as one new column named $Date_and_time, 
working_data$Date_and_time <- strptime(paste(raw_data$Date, raw_data$Time, sep = " "), 
                                       format = "%d/%m/%Y %H:%M:%S")
## Remove redundant factors
working_data$Date <- NULL
working_data$Time <- NULL

## Subsetting target duration
working_data <- working_data[working_data$Date_and_time >= as.POSIXlt("2007-02-01") & 
                               working_data$Date_and_time < as.POSIXlt("2007-02-03"),]

## Plot the data
with(working_data, plot(Date_and_time, Global_active_power, 
                        type = "l", 
                        xlab = "",
                        ylab = "Global Active Power (kilowatts)",
                        cex.lab = 0.8,
                        cex.axis = 0.8))

## Save to PNG file
dev.copy(png, file = "plot2.png", width = 480, height = 480, res = 72)
dev.off()