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
par(mfrow = c(2, 2))
with(working_data, {
  ## First plot
  plot(Date_and_time, Global_active_power, 
       type = "l", 
       xlab = "",
       ylab = "Global Active Power",
       cex.lab = 0.8,
       cex.axis = 0.8)
  
  ## Second plot
  plot(Date_and_time, Voltage, 
       type = "l",
       xlab = "datetime",
       ylab = "Voltage",
       cex.lab = 0.8,
       cex.axis = 0.8)
  
  ## Thrid plot
  plot(Date_and_time, Sub_metering_1, 
       type = "l", 
       xlab = "",
       ylab = "Energy sub metering",
       cex.lab = 0.8,
       cex.axis = 0.8)
  
  ## Adding 2 more lines for metering_2 and 3, and legend area
  lines(Date_and_time, Sub_metering_2, col = "red")
  lines(Date_and_time, Sub_metering_3, col = "blue")
  legend("topright", lty = 1, lwd = 1, box.lwd = 0, bg = NA,  col = c("black", "red", "blue"),
         legend = c("Sub_metering_1       ", "Sub_metering_2       ", "Sub_metering_3       "), cex = 0.7)
  
  ## Fourth plot
  plot(Date_and_time, Global_reactive_power, 
       type = "l",
       xlab = "datetime",
       cex.lab = 0.8,
       cex.axis = 0.8)
})

## Save to PNG file
dev.copy(png, file = "plot4.png", width = 480, height = 480, res = 72)
dev.off()