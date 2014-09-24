# Program to plot the total emission of PM2.5 in the U.S

#Please install the plyr package before executing the script.  > install.packages("plyr")  
library(plyr);

#Read the data from the dataset
NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds");
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds");

res <- ddply(NEI, "year" , summarize, sum = sum(Emissions));

png("plot1.png");
par(bg="powderblue", col.main="midnightblue", col.axis="midnightblue", col.sub="midnightblue", col.lab="midnightblue");
plot(x=res$year, y=res$sum, main="Total Emission Trend in U.S", sub="Decreasing trend of Emission : 1999-2008", xlab="Year", ylab="Total Emission Every Three Years", ylim = c(min(res$sum), max(res$sum)), xlim=c(1998, 2008),type="b", col="red", lwd=5);
dev.off();
