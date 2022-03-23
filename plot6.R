## Taylor Lange
## March 23, 2022
## Exploratory Data Analysis Final Project
## Plot 6 source code

## Set working directory
wd <- "/Users/milzm4/Documents/ExploratoryDataAnalysisProject2"

setwd(wd)


## Load in emissions data files you have downloaded into the working directory
NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

## Load ggplot2
library(ggplot2)


## Subset out vehicle emissions from Baltimore city and LA
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
vehiclesBaltimoreNEI <- vehiclesNEI[vehiclesNEI$fips == 24510,]
vehiclesBaltimoreNEI$city <- "Baltimore City"
vehiclesLANEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vehiclesLANEI$city <- "Los Angeles County"
both <- rbind(vehiclesBaltimoreNEI,vehiclesLANEI)


## Create plot
graph <- ggplot(both, aes(x=factor(year), y=Emissions, fill=city)) + geom_bar(aes(fill=year),stat="identity") + facet_grid(scales="free", space="free", .~city) + guides(fill=FALSE) + theme_bw() + labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))


## Check the plot is correct by printing it to the console
print(graph)

## Create and save plot to png file
png("plot6.png", width=480, height=480)

ggplot(both, aes(x=factor(year), y=Emissions, fill=city)) + geom_bar(aes(fill=year),stat="identity") + facet_grid(scales="free", space="free", .~city) + guides(fill=FALSE) + theme_bw() + labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

dev.off() 