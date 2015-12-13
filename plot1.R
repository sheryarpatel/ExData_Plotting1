##Exploratory Data Analysis
##Course Project 1
##Submitted By: Sheryar Patel

##Plot 1

## Importing Data
data_set <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_set$Date <- as.Date(data_set$Date, format="%d/%m/%Y")

## Subset Data
data <- subset(data_set, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_set)

## Configuring Dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plotting Data
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Exporting File
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()