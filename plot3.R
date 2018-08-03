# Code for plot 3 of 4
# Exploratory Data Analysis Week 1 project

dataFile <- "~/GitHub/Exploratory-Data-Analysis_Project_1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Setting up plot3
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMeter1 <- as.numeric(subSetData$Sub_metering_1)
subMeter2 <- as.numeric(subSetData$Sub_metering_2)
subMeter3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()