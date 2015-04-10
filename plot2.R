<<<<<<< HEAD
#reading data from the two rds files
NEI <- readRDS("summarySCC_PM25.rds") 

#read data of Maryland
MarylandData <- subset(NEI, fips == "24510") 

#summarize the emissions of every year
Emissions <- aggregate(MarylandData[, "Emissions"], by = list(MarylandData$year), FUN=sum) 

#round off the values of the emissions
Emissions$x = round(Emissions[,"x"]/1000,2)


#plot the data 
barplot(Emissions$x,names.arg = Emissions$Group.1, main = "Emissions in the 
        Three years in Maryland", xlab = "Year", ylab = "Emissions") 

#write the barchart to a png
dev.copy(png, file="plot2.png", height = 480, width = 480) 
dev.off()
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

#creating the plot
plot(subsetdata$Global_active_power ~ subsetdata$Datetime, type = "l", ylab = "Global Active Power", xlab = "") 

#write the plot to a png doc
dev.copy(png, file="plot2.png", height = 480, width = 480) 
dev.off()


                      
                      
>>>>>>> cb2083914ebe3a62b1777fb4a4d9aae610668cdd
