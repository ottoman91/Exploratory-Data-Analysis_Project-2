<<<<<<< HEAD
#reading data from the two rds files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")  

#take samples of data because data is too big
NEI_Sample <- NEI[sample(nrow(NEI), size = 2000, replace = FALSE),] 

#aggregate the results of the emissions
Emissions <- aggregate(NEI[, "Emissions"], by = list(NEI$year), FUN = sum) 

#round off the values of the emissions
Emissions$x = round(Emissions[,"x"]/1000,2)

#setting the settings of the plots
par(mfcol = c(1,5))

#plotting the diagrams 
barplot(Emissions$x,names.arg = Emissions$Group.1, main = "Emissions in the 
        Three years", xlab = "Year", ylab = "Emissions") 

#writing the graph on a png
dev.copy(png, file="plot1.png", height = 480, width = 480) 
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

#create the histogram
hist(subsetdata$Global_active_power, xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", main = "Global Active Power", col = "red") 

#saving the histogram to the png file
dev.copy(png, file="plot1.png", height = 480, width = 480)
>>>>>>> cb2083914ebe3a62b1777fb4a4d9aae610668cdd
dev.off()
