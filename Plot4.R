data <- read.csv("~/RProjectWork/Coursera_Exploratory_Data_Analysis/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE,na.strings=c("?"),colClasses = c(rep("character", 2), rep("numeric",7)))
data$dateTyped <- as.Date(data$Date,"%d/%m/%Y")
dataSubset <- data[data$dateTyped %in%  as.Date(c("2007-02-01", "2007-02-02")) ,]
dataSubset$dateTimeTyped <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dataSubset$dateTimeTyped, dataSubset$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dataSubset$dateTimeTyped, dataSubset$Voltage, type="l", xlab="datetime", ylab="Voltage")


plot(dataSubset$dateTimeTyped, dataSubset$Sub_metering_1,main="",type="n",xlab="",ylab="Energy sub metering")
lines(dataSubset$dateTimeTyped, dataSubset$Sub_metering_1, type="l",col="black")
lines(dataSubset$dateTimeTyped, dataSubset$Sub_metering_2, type="l",col="red")
lines(dataSubset$dateTimeTyped, dataSubset$Sub_metering_3, type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2,bty="n",col=c("black", "red", "blue"))

plot(dataSubset$dateTimeTyped, dataSubset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()

