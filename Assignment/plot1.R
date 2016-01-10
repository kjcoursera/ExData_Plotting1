
# reading the text file
data <- read.table("household_power_consumption.txt",header = TRUE,sep=";", na.strings = '?')

# Formatting Date & Time
data$Time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data$Date <- as.Date(data$Date,format='%d/%m/%Y')

# Subsetting the data between the two dates

DATE1 <- as.Date("01/02/2007", format='%d/%m/%Y')
DATE2 <- as.Date("02/02/2007", format='%d/%m/%Y')

dataToUse <- data[data$Date >= DATE1 & data$Date <= DATE2,]    

# Plotting
#opening the graphics device
png("plot1.png", width=480, height=480)

# hist
hist(dataToUse$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red"  )
# closing the graphical device
dev.off()
