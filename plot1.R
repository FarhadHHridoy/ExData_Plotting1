#reading data
unzip("ElectricalPowerConsumption.zip")
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)

#subsetting data of 1/2/2007 & 2/2/2007
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007" )

#plotting histogram
hist(as.numeric(subdata$Global_active_power),xlab = "Global Active Power (Kilowatts)",col = "red", main = " Global Active Power")

#saving the file as png
dev.copy(png,"plot1.png")
dev.off()
