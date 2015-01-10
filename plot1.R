# ----------------------------------------------------------------------------
## plot1.R: Histogram for Global Active Power
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
# Plot a histogram for the values under the column 'Global Active Power'

hist (eng.df [,"Global_active_power"], main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

# Copy to PNG file.
dev.copy (png, file="plot1.png")
dev.off()

# ----------------------------------------------------------------------------
