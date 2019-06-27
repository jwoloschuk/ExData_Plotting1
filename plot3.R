# Exploratory Data Analysis: Peer-graded Assignment: Course Project 1


# plot3.R will download the Electircal Power Consumption dataset and will produce 
# a plot detailing sub_metering energy use versus Time (day of the week).
# This is acomplished in a number of steps:



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

# Combine date columns into a single vector, convert to date class using strptime()

date_time <- paste(subset_data$Date, subset_data$Time)

date_time <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S")

# Create basic plot using plot(), add each sub metering separately 

png("plot3.png", width = 480, height = 480)

plot(date_time, subset_data$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")
points(date_time, subset_data$Sub_metering_2, type = "l", col = "red")
points(date_time, subset_data$Sub_metering_3, type = "l", col = "blue")

# Add legend to the plot

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

dev.off()

