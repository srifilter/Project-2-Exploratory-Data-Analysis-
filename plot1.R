
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
tot<-tapply(NEI$Emissions, NEI$year, sum)
plot(names(tot),tot, xlab="Year", ylab="PM2.5 Emissions", main= expression(" Total USP"~PM[2.5]~"Emissions (tons)", type="l", lty=6, pch= 19, col="purple"))
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()