#reading data
unzip("ElectricalPowerConsumption.zip")
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)

#subsetting data of 1/2/2007 & 2/2/2007
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007" )

DateTime <- paste(subdata$Date,subdata$Time)

subdata$DateTime <- strptime(DateTime,"%d/%m/%Y %H:%M:%S")


#plotting 
  plot(subdata$DateTime,subdata$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
  points(subdata$DateTime,subdata$Sub_metering_2,type = "l",col = "red")
  points(subdata$DateTime,subdata$Sub_metering_3,type = "l",col = "blue")
  legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = "1")
  

#saving the file as png
dev.copy(png,"plot3.png")
dev.off()
