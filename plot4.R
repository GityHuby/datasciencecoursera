#Script to find the PM2.5 emmission trend for coal based sources in the U.S

#Install plyr and ggplot2 package before running the code. >install.packages("plyr")
#                                                          >install.packages("ggplot2")                                    
library(plyr);
library(ggplot2);

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds");
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds");

#4. Across the United States, how have emissions from coal combustion-related sources 
#changed from 1999–2008? 
coalBasedSources <- SCC[grep("coal", SCC$EI.Sector, ignore.case="TRUE"),1];
coalSourceNEI <- NEI[NEI$SCC %in% coalBasedSources,];
res <- ddply(coalSourceNEI, "year" , summarize, sum = sum(Emissions));
g <- ggplot(res, aes(year,sum));
g <- g + theme(plot.background = element_rect(fill = 'lightsteelblue1'));
g <- g + theme(panel.background = element_rect(fill = 'lightsteelblue3')); 
g <- g + geom_point(colour="midnightblue", shape=16, size=6) + geom_line(linetype="solid", colour="midnightblue", size=2); #alpha, 
g <- g + ggtitle("Emission Trend of Coal Combusion based Sources in U.S")+xlab("Year")+ylab("Total Emission");
png("plot4.png", width=1000, height=600);
print(g);
dev.off();