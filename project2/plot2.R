# Questions
# You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.
library(plyr);

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds");
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds");

#1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
#res <- ddply(NEI, "year" , summarize, sum = sum(Emissions));
#png("plot1.png");
#par(bg="powderblue", col.main="midnightblue", col.axis="midnightblue", col.sub="midnightblue", col.lab="midnightblue");
#plot(x=res$year, y=res$sum, main="Total Emission Trend in U.S", sub="Decreasing trend of Emission : 1999-2008", xlab="Year", ylab="Total Emission Every Three Years", ylim = c(min(res$sum), max(res$sum)), xlim=c(1998, 2008),type="b", col="red", lwd=5);
#dev.off();

#2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
frameBCML <-NEI[NEI$fips=="24510",]; 
res <- ddply(frameBCML, "year" , summarize, sum = sum(Emissions));
png("plot2.png");
par(bg="powderblue", col.main="midnightblue", col.axis="midnightblue", col.sub="midnightblue", col.lab="midnightblue");
plot(x=res$year, y=res$sum, main="Total Emission Trend in Baltimore City, Maryland", sub="Fluctuating Trend of Emission : 1999-2008", xlab="Year", ylab="Total Emission in Three Years", ylim = c(min(res$sum), max(res$sum)), xlim=c(1998, 2009),type="b", col="red", lwd=5);
dev.off();


#3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
# 
#4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
# 
#5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
# 
#6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
# 


# Making and Submitting Plots
# 
# For each plot you should
# 
# Construct the plot and save it to a PNG file.
# 
# Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You should also include the code that creates the PNG file. Only include the code for a single plot (i.e. plot1.R should only include code for producing plot1.png)
# 
# Upload the PNG file on the Assignment submission page
# 
# Copy and paste the R code from the corresponding R file into the text box at the appropriate point in the peer assessment.
