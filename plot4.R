# ----------------------------------------------------------------------------
## plot4.R - Four plots
## Author - Maytrics
## Coursera; Exploratory Data Analysis; Course Project 1; January 2015
## Data Distributor: UC Irvine Machine Learning Repository 
#					 [http://archive.ics.uci.edu/ml/] 
## Dataset for Project: Electric Power Consumption 
#						[https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip]
# ----------------------------------------------------------------------------

# Local file with Electric Power Consumption dataset
datafile <- "household_power_consumption.txt"

# .............................................................................
# Read relevant part of the dataset 
# Start: first row for 1/2/2007 at line #66638 (by skipping header + 66636 rows
# End: last row for 2/2/2007, which is start + 2880
# NOTE: Separator = ";" and NA values are "?"

eng.df <- read.csv (datafile, header=TRUE, sep=";", skip=66636, nrows=2880, na.strings="?")

# Read and set column names.
header.only <- read.csv (datafile, header=TRUE, sep=";",nrows=1)
colnames (eng.df) <- colnames (header.only)


# .............................................................................
# Add a column that combines Date and Time
Dates <- as.Date(eng.df$Date, format="%d/%m/%Y")
Times <- eng.df$Time
eng.df$DateTime <- as.POSIXct(paste(as.character(Dates),as.character(Times)))

# We want four plots in a 2x2 grid.
par (mfrow = c(2, 2))

# plot @[1, 1] -- X: Time vs Y:Global Active Power
plot (x=eng.df$DateTime, y=eng.df$Global_active_power, ylab="Global Active Power (killowatts)", xlab="", type="l")

# plot @[1, 2]-- X: Time vs Y:Voltage
plot (x=eng.df$DateTime, y=eng.df$Voltage, ylab="Voltage", xlab="datetime", type="l")

# plot @[2, 1] X: Time vs Y:Sub_metering 1, 2 and 3
plot (x=eng.df$DateTime, y=eng.df$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
lines (x=eng.df$DateTime, y=eng.df$Sub_metering_2, type="l", col="red")
lines (x=eng.df$DateTime, y=eng.df$Sub_metering_3, type="l", col="blue")
legend ("topright", 
		legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3" ), 
		col=c("black", "red", "blue"), pch="-", lwd=3, bty="n")

# plot @[2, 2] -- X: Time vs Y:Global Rective Power
plot (x=eng.df$DateTime, y=eng.df$Global_reactive_power, 
		ylab="Global_reactive_power", xlab="datetime", type="l")

# Copy to PNG file.
dev.copy (png, file="plot4.png")
dev.off()

# ----------------------------------------------------------------------------
