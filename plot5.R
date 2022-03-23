## Taylor Lange
## March 23, 2022
## Exploratory Data Analysis Final Project
## Plot 5 source code

## Set working directory
wd <- "/Users/milzm4/Documents/ExploratoryDataAnalysisProject2"

setwd(wd)


## Load in emissions data files you have downloaded into the working directory
NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

## Load ggplot2
library(ggplot2)


## Subset out vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

## Subset out vehicles in Baltimore only
vehiclesBaltimoreNEI <- vehiclesNEI[vehiclesNEI$fips == 24510,]


## Create plot
graph <- ggplot(vehiclesBaltimoreNEI, aes(factor(year), Emissions)) + geom_bar(stat = "identity",fill = "grey",width = 0.75) + theme_bw() +  guides(fill = FALSE) + labs(x = "year", y = expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + labs(title = expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))


## Check the plot is correct by printing it to the console
print(graph)

## Create and save plot to png file
png("plot5.png", width=480, height=480)

ggplot(vehiclesBaltimoreNEI, aes(factor(year), Emissions)) + geom_bar(stat = "identity",fill = "grey",width = 0.75) + theme_bw() +  guides(fill = FALSE) + labs(x = "year", y = expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + labs(title = expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

dev.off() 