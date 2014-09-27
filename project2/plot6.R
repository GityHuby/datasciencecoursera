# Questions
# You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.
library(plyr);
library(ggplot2);

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds");
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds");

vehicleSources <- SCC[grep("vehicles", SCC$EI.Sector, ignore.case="TRUE"),1]
vehicleSourcesNEI <- NEI[NEI$SCC %in% vehicleSources,]; #CHECK : the $type do not contain only ONROAD, but also POINT type too.!!
baltiLA <- vehicleSourcesNEI[vehicleSourcesNEI$fips %in% c("24510","06037"),]; #or can use >vehicleSourceNEI[(vehicleSourcesNEI$fips=="24510" | vehicleSourcesNEI$fips=="06037"),];
res <- ddply(baltiLA, c("fips","year") , summarize, TotalEmission = sum(Emissions));
res$fips <- revalue(res$fips, c("06037"="Los Angles", "24510"="Baltimore City"));
g <- ggplot(res, aes(x=year,y=TotalEmission,colour=fips))+geom_line();
g <- g + theme(plot.background = element_rect(fill = 'ivory1'));
g <- g + theme(panel.background = element_rect(fill = 'ivory2')); 
g <- g + ggtitle("Comparision of Motor Vehicle Emission in Baltimore City and Los Angles")+xlab("Year")+ylab("Total Emission in 3 years");
png("plot6.png", width=1000, height=600);
print(g);
dev.off();
