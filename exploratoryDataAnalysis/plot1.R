
# To plot a histogram as per the image shown in Project 1.1

#Read the data from the file
data <- read.csv("household_power_consumption.txt",sep=";", na.strings="?", stringsAsFactors=FALSE);
#Subset the data for only the two days
dataSub <- data[min(which(data$Date=="1/2/2007")):max(which(data$Date == "2/2/2007")),];
#Open a histogram file named. 
png(file="plot1.png",width=480, height=480);
#Plot the histogram with appropriate settings.
hist(dataSub$Global_active_power, main="Global Active Power", col = "red", ylab="Frequency", xlab="Global Active Power(Kilowatts)");
#Close the file device.
dev.off();
