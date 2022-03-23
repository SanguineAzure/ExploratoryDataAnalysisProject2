## Taylor Lange
## March 23, 2022
## Exploratory Data Analysis Final Project
## Plot 3 source code

## Set working directory
wd <- "/Users/milzm4/Documents/ExploratoryDataAnalysisProject2"

setwd(wd)


## Load in emissions data files you have downloaded into the working directory
NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

## Load ggplot2
library(ggplot2)

## Create plot
graph <- ggplot(baltimoreNEI, aes(factor(year), Emissions,fill = type)) + geom_bar(stat = "identity") + theme_bw() + guides() + facet_grid(.~type, scales = "free", space = "free") + labs(x = "Year", y = expression("Total PM"[2.5]*" Emission (tons)")) + labs(title = expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

## Check the plot is correct by printing it to the console
print(graph)


## Create and save plot to png file
png("plot3.png", width=480, height=480)

ggplot(baltimoreNEI, aes(factor(year), Emissions,fill = type)) + geom_bar(stat = "identity") + theme_bw() + guides() + facet_grid(.~type, scales = "free", space = "free") + labs(x = "Year", y = expression("Total PM"[2.5]*" Emission (tons)")) + labs(title = expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

dev.off() 