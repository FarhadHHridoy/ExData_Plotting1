#reading data
unzip("ElectricalPowerConsumption.zip")
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)

#subsetting data of 1/2/2007 & 2/2/2007
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007" )

DateTime <- paste(subdata$Date,subdata$Time)

subdata$DateTime <- strptime(DateTime,"%d/%m/%Y %H:%M:%S")

#viewing the levels of the dateTime
library(lubridate)
wday(subdata$DateTime, label=TRUE)


#plotting 
with(subdata,plot(DateTime,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (Kilowatts)"))
     
#saving the file as png
 dev.copy(png,"plot2.png")
 dev.off()
     