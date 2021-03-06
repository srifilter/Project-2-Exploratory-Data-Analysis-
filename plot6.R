library(ggplot2)
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
calmotor<-subset(NEI, fips=="06037" & type=="ON-ROAD")
calmotortot <- aggregate(calmotor[c("Emissions")], list(type = calmotor$type, year = calmotor$year, zip = calmotor$fips), sum)
balmotor<-subset(NEI, fips=="24510" & type=="ON-ROAD")
balmotortot <- aggregate(balmotor[c("Emissions")], list(type = balmotor$type, year = balmotor$year, zip = balmotor$fips), sum)
tot<-rbind(calmotortot,balmotortot) 
qplot(year, Emissions, data = tot, color = zip, geom= "line", ylim = c(-100, 5500)) + ggtitle("Motor Vehicle Emissions in Baltimore (24510) \nvs. Los Angeles (06037) Counties") + xlab("Year") + ylab("Emission Levels") 
dev.copy(png, file="plot6.png", height=480, width=480)
dev.off()