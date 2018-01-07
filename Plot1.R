data <- read.csv("~/RProjectWork/Coursera_Exploratory_Data_Analysis/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE,na.strings=c("?"),colClasses = c(rep("character", 2), rep("numeric",7)))
data$dateTyped <- as.Date(data$Date,"%d/%m/%Y")
dataSubset <- data[data$dateTyped %in%  as.Date(c("2007-02-01", "2007-02-02")) ,]
png("plot1.png", width=480, height=480)
hist(dataSubset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
