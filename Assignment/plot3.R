# reading the text file
data <- read.table("household_power_consumption.txt",header = TRUE,sep=";", na.strings = '?')

# Formatting Date & Time 
data$Time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data$Date <- as.Date(data$Date,format='%d/%m/%Y')

# Subsetting the data between two dates

DATE1 <- as.Date(" 01/02/2007", format='%d/%m/%Y')
DATE2 <- as.Date("02/02/2007", format='%d/%m/%Y')

dataToUse <- data[data$Date >= DATE1 & data$Date <= DATE2,] 


#plotting

png("plot3.png", width=480, height=480)
plot(dataToUse$Time,dataToUse$Sub_metering_1,type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(dataToUse$Time,dataToUse$Sub_metering_2,type = "l",col = "red")
lines(dataToUse$Time,dataToUse$Sub_metering_3,type = "l",col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
dev.off()