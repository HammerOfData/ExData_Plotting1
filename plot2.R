## Plot 2

# Set directory
#setwd("N:/Projects/Coursera/Course 4 - Exploratory Analysis/PeerProject1")

# Unzip the data folder
unzip("exdata-data-household_power_consumption.zip")

# Load the household power consumption data (data contains "?" -> sets them to NA)
data <- read.table("household_power_consumption.txt",na = "?",header = TRUE,sep = ";",colClasses = c("character", "character", rep("numeric",7)))

# Inspect data
head(data)

# Extract data from the dates 2007-02-01 and 2007-02-02
data_relevant <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Attach the new variables
attach(data_relevant)

# Create a single date and time variable to be able to sort easy
data_relevant$DateTime<- strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")

## Create plot 2
png(filename = "plot2.png",  width = 480, height = 480,units = "px")
plot(data_relevant$DateTime, data_relevant$Global_active_power, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
