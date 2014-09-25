#Script to find the PM2.5 emmission trend for various type of sources

#Install plyr package before running the code. >install.packages("plyr")
library(plyr);
library(ggplot2);

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds");
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds");

frameBCML <-NEI[NEI$fips=="24510",];
res <- ddply(frameBCML, c("year","type") , summarize, sum = sum(Emissions));

g <- ggplot(res, aes(year,sum));
g <- g + theme(plot.background = element_rect(fill = 'lightsteelblue1'));
g <- g + theme(panel.background = element_rect(fill = 'lightsteelblue3')); 
g <- g + geom_point(colour="midnightblue", shape="*", size=10) + geom_line(linetype="solid", colour="midnightblue", size=2); #alpha, 
g <- g + ggtitle("Emission Trend for various Type of Sources")+xlab("Year")+ylab("Total Emission");
g <- g+ facet_grid(.~type);
png("plot3.png", width=1000, height=600);
print(g);
dev.off();