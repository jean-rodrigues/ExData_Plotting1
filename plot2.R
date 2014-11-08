library(data.table)
tb<-fread("household_power_consumption.txt", na.strings='?', header=TRUE)
filteredData <- tb[Date=="1/2/2007" | Date=="2/2/2007"]
dates <- filteredData$Date
times <- filteredData$Time
x <- paste(dates, times)
data <- cbind(filteredData, strptime(x, "%d/%m/%Y %H:%M:%S"))
colnames(data)[ncol(data)] <- "DateTime"


## for some reason, the graph shows week days in portuguese (which is my native language)
## qui = Thu, sex = Fri, sáb = Sat

png(file="plot2.png",height=480,width=480)
plot(data$DateTime, data$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(as.numeric(data$Global_active_power)~data$DateTime, col="black")
dev.off()
