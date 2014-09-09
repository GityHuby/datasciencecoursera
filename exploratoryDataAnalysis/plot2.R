# To plot the Global Active power on 2 given dates as per the image shown in Project 1.2

#Read the data from the file
data <- read.csv("household_power_consumption.txt",sep=";", na.strings="?", stringsAsFactors=FALSE);
#Subset the data for only the two days
dataSub <- data[min(which(data$Date=="1/2/2007")):max(which(data$Date == "2/2/2007")),];
#Strip and combine the date and time information
dataSub$DateTime <- strptime(paste(dataSub$Date, dataSub$Time), format="%d/%m/%Y %H:%M:%S");
#Open a histogram file named. 
png(file="plot2.png",width=480, height=480);
#Plot the graph
plot(x=dataSub$DateTime, y = dataSub$Global_active_power, type="l",xlab="",ylab = "Global Active Power(kilowatt)");
#Close the file device.
dev.off();
