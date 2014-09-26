#Script to find the PM2.5 emmission trend for coal based sources in the U.S

#Install plyr and ggplot2 package before running the code. >install.packages("plyr")
#                                                          >install.packages("ggplot2")                                    
library(plyr);
library(ggplot2);

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds");
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds");

#5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
vehicleSources <- SCC[grep("vehicles", SCC$EI.Sector, ignore.case="TRUE"),1]
vehicleSourcesNEI <- NEI[NEI$SCC %in% vehicleSources,]; #CHECK : the $type do not contain only ONROAD, but also POINT type too.!!
balti <- subset(vehicleSourcesNEI, vehicleSourcesNEI$fips=="24510");
res <- ddply(balti, "year" , summarize, sum = sum(Emissions));

g <- ggplot(res, aes(year,sum));
#Can try changing the colors of the plot and add new information to it while upload.
g <- g + theme(plot.background = element_rect(fill = 'lightsteelblue1'));
g <- g + theme(panel.background = element_rect(fill = 'lightsteelblue3')); 
g <- g + geom_point(colour="midnightblue", shape=16, size=6) + geom_line(linetype="solid", colour="midnightblue", size=2); #alpha, 
g <- g + ggtitle("Motor Vehicle Emission in Baltimore City")+xlab("Year")+ylab("Total Emission in 3 years");
 png("plot5.png", width=1000, height=600);
 print(g);
 dev.off();
