## Taylor Lange
## March 23, 2022
## Exploratory Data Analysis Final Project
## Plot 1 source code

## Set working directory
wd <- "/Users/milzm4/Documents/ExploratoryDataAnalysisProject2"

setwd(wd)


## Load in emissions data files you have downloaded into the working directory
NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")


## Calculate the sum of ALL emissions for each year
totalpm <- aggregate(Emissions ~ year,NEI, sum)


## Create barplot using base plotting system
barplot((totalpm$Emissions)/10^6,names.arg=totalpm$year, xlab="Year", ylab="PM2.5 Emissions (10^6 Tons)", main="Total PM2.5 Emissions From All Sources")


## Create and save barplot to png file
png("plot1.png", width=480, height=480)

barplot((totalpm$Emissions)/10^6,names.arg=totalpm$year, xlab="Year", ylab="PM2.5 Emissions (10^6 Tons)", main="Total PM2.5 Emissions From All Sources")

dev.off() 