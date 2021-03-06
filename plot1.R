### plot1 ###
#   Author: Colleen Davies

## Reading the data 

# Here we assume the data is already saved as "household_power_consumption.txt"
#   in the working directory.

# Read full data table
HPCfile <- "household_power_consumption.txt" # downloaded March 3, 2020 from Coursera
HPCdf <- read.table(file = HPCfile, header = TRUE, sep = ";", row.names = NULL, 
                   col.names = c("Date", "Time", "Global_active_power", 
                                 "Global_reactive_power", "Voltage", 
                                 "Global_intensity", "Sub_metering_1", 
                                 "Sub_metering_2","Sub_metering_3"),
                   na.strings = "?", 
                   colClasses = c("character", "character", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric", "numeric",
                                  "numeric")) # dim(HPCdf) = 2075259 x 9
HPCdf$Date <- as.Date(HPCdf$Date, format = "%d/%m/%Y") # for subsetting

# Subsetting the data frame for the two dates
HPCdfsub <- subset(HPCdf, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
HPCdfsub$DateTime <- paste(HPCdfsub$Date, HPCdfsub$Time) # combining Date & Time
HPCdfsub$DateTime <- strptime(HPCdfsub$DateTime, format = "%Y-%m-%d %H:%M:%S") # POSIXlt

## Producing the plot

# Launch graphics device
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")

# Constructing the plot
hist(HPCdfsub$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

# Close graphics device
dev.off()


