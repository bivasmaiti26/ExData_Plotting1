wholedata <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
filtereddata <- wholedata[(wholedata$Date=="1/2/2007" | wholedata$Date=="2/2/2007" ), ]

#format date and time
filtereddata$Date <- as.Date(filtereddata$Date, format="%d/%m/%Y")
dateTime <- paste(filtereddata$Date, filtereddata$Time)
filtereddata$DateTime <- as.POSIXct(dateTime)

#plot the graph
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(filtereddata, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power", xlab="", cex=0.8)
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage", xlab="datetime", cex=0.8)
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Energy Sub Meeting", xlab="", cex=0.8)
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5)
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global_Rective_Power",xlab="datetime", cex=0.8)
})
#export graph as png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()