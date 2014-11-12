library(data.table)
tb<-fread("household_power_consumption.txt", na.strings='?', header=TRUE)
filteredData <- tb[Date=="1/2/2007" | Date=="2/2/2007"]
dates <- filteredData$Date
times <- filteredData$Time
x <- paste(dates, times)
data <- cbind(filteredData, strptime(x, "%d/%m/%Y %H:%M:%S"))
colnames(data)[ncol(data)] <- "DateTime"

png(file="plot4.png",height=480,width=480)
par(mfrow=c(2,2))

## Graph 1
plot(data$DateTime, data$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(as.numeric(data$Global_active_power)~data$DateTime, col="black")

## Graph 2
plot(data$DateTime, data$Voltage, type="n", ylab="Voltage", xlab="datetime")
lines(as.numeric(data$Voltage)~data$DateTime, col="black")

## Graph 3
plot(data$DateTime, data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
with(data, lines(as.numeric(data$Sub_metering_1)~data$DateTime, col="black"))
with(data, lines(as.numeric(data$Sub_metering_2)~data$DateTime, col="red"))
with(data, lines(as.numeric(data$Sub_metering_3)~data$DateTime, col="blue"))
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")

## Graph 4
plot(data$DateTime, data$Global_reactive_power, type="n", xlab="", ylab="Global_reactive_power")
lines(as.numeric(data$Global_reactive_power)~data$DateTime, col="black", xlab="datetime", ylab="Global_reactive_power")

dev.off()
