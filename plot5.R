#read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds") 

#read data of Maryland
MarylandData <- subset(NEI, fips == "24510") 

#only read the required data of the coal related sources
VehiclePattern <- grepl("vehicles",SCC$SCC.Level.Two,ignore.case = TRUE) 

#subset the required data from the NEI R data object
SCC.Required <- SCC[VehiclePattern,]$SCC 
Maryland.data <- MarylandData[MarylandData$SCC %in% SCC.Required,]  

#aggregate the emissions every year
Emissions <- aggregate(Maryland.data[, "Emissions"], by = list(Maryland.data$year), FUN = sum) 

#round off the values of the emissions
Emissions$x = round(Emissions[,"x"]/1000,2)  

#plot the emissions 
barplot(Emissions$x,names.arg = Emissions$Group.1, main = "Emissions From Motor Vehicle
        Sources in Baltimore City", xlab = "Year", ylab = "Emissions") 

#writing the graph on a png
dev.copy(png, file="plot5.png", height = 480, width = 480) 
dev.off()