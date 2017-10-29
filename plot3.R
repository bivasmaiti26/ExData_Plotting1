wholedata <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
filtereddata <- wholedata[(wholedata$Date=="1/2/2007" | wholedata$Date=="2/2/2007" ), ]

#format date and time
filtereddata$Date <- as.Date(filtereddata$Date, format="%d/%m/%Y")
dateTime <- paste(filtereddata$Date, filtereddata$Time)
filtereddata$DateTime <- as.POSIXct(dateTime)
#set device
png(filename = "plot3.png", width = 480, height = 480, units = "px")
#plot the graph
with(filtereddata, {
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Energy sub metering", xlab="", cex=0.8)
  lines(Sub_metering_2~DateTime, col='Red')
  lines(Sub_metering_3~DateTime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)
dev.off()