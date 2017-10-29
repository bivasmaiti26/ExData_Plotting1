#read the data set with headers and na strings
wholedata <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
#filter the data based on dates
filtereddata <- wholedata[(wholedata$Date=="1/2/2007" | wholedata$Date=="2/2/2007" ), ]
#format date and time
filtereddata$Date <- as.Date(filtereddata$Date, format="%d/%m/%Y")
dateTime <- paste(filtereddata$Date, filtereddata$Time)
filtereddata$DateTime <- as.POSIXct(dateTime)
#plot the graph
plot(filtereddata$Global_active_power~filtereddata$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
#export graph as png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()