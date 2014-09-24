#Script to find the total emmission of PM2.5 in Baltimore City, MaryLand

#Install plyr package before running the code. >install.packages("plyr")
library(plyr);

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds");
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds");

frameBCML <-NEI[NEI$fips=="24510",]; 
res <- ddply(frameBCML, "year" , summarize, sum = sum(Emissions));
png("plot2.png");
par(bg="powderblue", col.main="midnightblue", col.axis="midnightblue", col.sub="midnightblue", col.lab="midnightblue");
plot(x=res$year, y=res$sum, main="Total Emission Trend in Baltimore City, Maryland", sub="Fluctuating Trend of Emission : 1999-2008", xlab="Year", ylab="Total Emission in Three Years", ylim = c(min(res$sum), max(res$sum)), xlim=c(1998, 2009),type="b", col="red", lwd=5);
dev.off();