library(data.table)
tb<-fread("household_power_consumption.txt", na.strings='?', header=TRUE)
filteredData <- tb[Date=="1/2/2007" | Date=="2/2/2007"]
png(file="plot1.png",height=480,width=480)
hist(as.numeric(filteredData$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()