library(ggplot2)
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
coal<-SCC[grepl("Coal", SCC$Short.Name),]
NEI_coal<-NEI[NEI$SCC %in% coal$SCC,]
plot4 <- ggplot(NEI_coal, aes(x = factor(year), y = Emissions, fill =type)) + geom_bar(stat= "identity", width = .4) + xlab("year") +ylab("Coal-Related"~PM[2.5]~"Emissions") + ggtitle("Total Coal-Related"~PM[2.5]~"Emissions")
print(plot4)
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()