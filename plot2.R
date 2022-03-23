## Taylor Lange
## March 23, 2022
## Exploratory Data Analysis Final Project
## Plot 2 source code

## Set working directory
wd <- "/Users/milzm4/Documents/ExploratoryDataAnalysisProject2"

setwd(wd)


## Load in emissions data files you have downloaded into the working directory
NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")


## Sum up all emissions for Baltimore City only
baltimoreNEI <- NEI[NEI$fips=="24510",]

TotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)


## Create barplot using base plotting system
barplot(TotalsBaltimore$Emissions, names.arg=TotalsBaltimore$year, xlab="Year", ylab="PM2.5 Emissions (Tons)", main="Total PM2.5 Emissions From All Baltimore Sources")


## Create and save barplot to png file
png("plot2.png", width=480, height=480)

barplot(TotalsBaltimore$Emissions, names.arg=TotalsBaltimore$year, xlab="Year", ylab="PM2.5 Emissions (Tons)", main="Total PM2.5 Emissions From All Baltimore Sources")

dev.off() 