library(data.table)
tb<-fread("household_power_consumption.txt", na.strings='?', header=TRUE)
filteredData <- tb[Date=="1/2/2007" | Date=="2/2/2007"]
dates <- filteredData$Date
times <- filteredData$Time
x <- paste(dates, times)
data <- cbind(filteredData, strptime(x, "%d/%m/%Y %H:%M:%S"))
colnames(data)[ncol(data)] <- "DateTime"

png(file="plot3.png",height=480,width=480)
plot(data$DateTime, data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
with(data, lines(as.numeric(data$Sub_metering_1)~data$DateTime, col="black"))
with(data, lines(as.numeric(data$Sub_metering_2)~data$DateTime, col="red"))
with(data, lines(as.numeric(data$Sub_metering_3)~data$DateTime, col="blue"))
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
