#reading data
unzip("ElectricalPowerConsumption.zip")
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)

#subsetting data of 1/2/2007 & 2/2/2007
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007" )

DateTime <- paste(subdata$Date,subdata$Time)

subdata$DateTime <- strptime(DateTime,"%d/%m/%Y %H:%M:%S")


#plotting
par(mfcol=c(2,2))

with(subdata,{
  
  plot(DateTime,Global_active_power,xlab = "",ylab = "Global Active Power",type = "l")
  
  plot(DateTime,Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
  points(DateTime,Sub_metering_2,type = "l",col = "red")
  points(DateTime,Sub_metering_3,type = "l",col = "blue")
  legend("topright",col = c("black","red","blue"),
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty=c(1,1,1), bty="n", cex=.5)
  
  plot(DateTime,Voltage,xlab = "datetime",ylab = "Voltage",type = "l")
  
  plot(DateTime,Global_reactive_power,xlab = "datetime",ylab = "Global_reactive_power",type = "l")
  
  
})





#saving the file as png
dev.copy(png,"plot4.png")
dev.off()
