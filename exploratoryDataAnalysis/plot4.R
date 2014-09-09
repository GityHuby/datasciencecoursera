
# multi plot as per the image shown in Project 1.4

#Read the data from the file
data <- read.csv("household_power_consumption.txt",sep=";", na.strings="?", stringsAsFactors=FALSE);
#Subset the data for only the two days
dataSub <- data[min(which(data$Date=="1/2/2007")):max(which(data$Date == "2/2/2007")),];
dataSub$DateTime <- strptime(paste(dataSub$Date, dataSub$Time), format="%d/%m/%Y %H:%M:%S");
#Open a histogram file named. 
png(file="plot4.png",width=480, height=480);
#create 4 sections in the single image
par(mfrow=c(2,2));
#Plot the graph with appropriate settings.

    plot(x=dataSub$DateTime, y = dataSub$Global_active_power, type="l",xlab="",ylab = "Global Active Power");

    plot(x=dataSub$DateTime, y = dataSub$Voltage, type="l",xlab="datetime",ylab = "Voltage");
    
    plot(x=dataSub$DateTime,  y=dataSub$Sub_metering_1, type="l",xlab="",ylab = "Energy Sub metering");
    lines(x=dataSub$DateTime, y=dataSub$Sub_metering_2, type="l", col="red");
    lines(x=dataSub$DateTime, y=dataSub$Sub_metering_3, type="l", col="blue");
    legend("topright",col=c("black","red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"));
    
    plot(x=dataSub$DateTime, y = dataSub$Global_reactive_power, type="l",xlab="datetime",ylab = "Global_reactive_power");

dev.off();
