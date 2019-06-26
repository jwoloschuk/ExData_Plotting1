# Exploratory Data Analysis: Peer-graded Assignment: Course Project 1


# plot1.R will download the Electircal Power Consumption dataset and will produce 
# a plot detailing Global Active Power (kilowatt) versus Frequency.
# This is acomplished in a number of steps:

# Load tidyr package

library(tidyr)
library(gsubfn)

# Set working directory, save the zip file URL, and the zip file name

setwd("C:/Users/jordan.woloschuk/Documents/GitHub/ExData_Plotting1")

zip_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

zip_file <- "exdata_data_household_power_consumption.zip"

# Name the text file that was contained in the zip file

data_text <- "household_power_consumption.txt"


# Checks if the "household_power_consumption.txt" file exists. If not, checks to 
# see if the zip file is in the directory, if not, then downloads the zip file.
# The zip file is then unzipped and the zipfile is then removed from the working
# directory.

if (!file.exists(data_text)){
        if (!file.exists(zip_file)) {
                download.file(zip_url, zip_file, method = "curl")
        }
        
        # Unzip the zip file
        unzip(zip_file)
        
        # Remove the zip file to keep the repository tidy
        file.remove(zip_file)
}



# Read the text file for all data

data_table <- read.table(data_text, header = TRUE, sep = ";", na.strings = "?")

# Subset the data table for only dates between 2007-02-01 and 2007-02-02 

subset_data <- subset(data_table, data_table$Date == "1/2/2007" | data_table$Date == "2/2/2007")

# Create basic plot using hist(), set the color to red, add main title and correct x axis label

png(filename = "plot1.png", width = 480, height = 480)

hist(subset_data$Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
