# To plot the 3 meter reading on single graph as per the image shown in Project 1.3

#Read the data from the file
data <- read.csv("household_power_consumption.txt",sep=";", na.strings="?", stringsAsFactors=FALSE);
#Subset the data for only the two days
dataSub <- data[min(which(data$Date=="1/2/2007")):max(which(data$Date == "2/2/2007")),];
#Strip and combine the date and time information
dataSub$DateTime <- strptime(paste(dataSub$Date, dataSub$Time), format="%d/%m/%Y %H:%M:%S");
#Open a file named. 
png(file="plot3.png",width=480, height=480);
#Plot the graph
plot(x=dataSub$DateTime, y = dataSub$Sub_metering_1, type="l",xlab="",ylab = "Energy Sub metering");
lines(x=dataSub$DateTime, y=dataSub$Sub_metering_2, type="l", col="red");
lines(x=dataSub$DateTime, y=dataSub$Sub_metering_3, type="l", col="blue");
legend("topright",lty=1,col=c("black","red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"));
#Close the file device.
dev.off();
