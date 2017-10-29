#read the data set with headers and na strings
wholedata<-read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
#filter the data based on dates
filtereddata<- wholedata[(wholedata$Date=="1/2/2007" | wholedata$Date=="2/2/2007" ), ]
#plot histogram
hist(filtereddata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", cex.sub=0.8)
#export graph as png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

