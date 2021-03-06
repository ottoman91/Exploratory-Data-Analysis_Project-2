<<<<<<< HEAD
#reading data from the two rds files
NEI <- readRDS("summarySCC_PM25.rds") 

#read data of Baltimore City
MarylandData <- subset(NEI, fips == "24510") 

#plot the graph using ggplot2
qplot(year,Emissions,data = MarylandData,geom = c("point", "smooth"),method = "lm",
      facets = .~type) 

#write the barchart to a png
=======
#reading data from the text file
dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 

#converting format of Data variable
dataset$Date = as.Date(dataset$Date, format="%d/%m/%Y")

#subsetting and only recording values of the required dates
subsetdata <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Converting date time in posix
datetime <- paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$Datetime <- as.POSIXct(datetime) 

#Creating the plot
with(subsetdata,{ plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering", 
                      xlab = "")
                  lines(Sub_metering_2 ~ Datetime, col = "red")
                  lines(Sub_metering_3 ~ Datetime, col = "blue")
     }) 

#Construct the legend of the plot
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 

#write the plot to a png doc
>>>>>>> cb2083914ebe3a62b1777fb4a4d9aae610668cdd
dev.copy(png, file="plot3.png", height = 480, width = 480) 
dev.off()