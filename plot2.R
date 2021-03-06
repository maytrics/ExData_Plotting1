# ----------------------------------------------------------------------------
## plot2.R: Plot for Time vs. Global Active Power
## Author: Maytrics
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

# plot @[1, 1] -- X: Time vs Y:Global Active Power
plot (x=eng.df$DateTime, y=eng.df$Global_active_power, ylab="Global Active Power (killowatts)", xlab="", type="l", )


# Copy to PNG file.
dev.copy (png, file="plot2.png")
dev.off()

# ----------------------------------------------------------------------------
