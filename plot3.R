# read in partial data with skip and nrows
# choose skip=66000, nrows=4000 by sample and check the approximate date range
rawdata <- read.table("Electric power consumption/household_power_consumption.txt", head=T, skip=66000, nrows=4000, sep=";",na.strings="?")

# name the data column
names(rawdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# convert the column data type
rawdata$Time <- strptime(paste(rawdata$Date, rawdata$Time),"%d/%m/%Y %H:%M:%S")
rawdata$Date <- as.Date(rawdata$Date,"%d/%m/%Y")

# subset the data to the specified date
subdata <- subset(rawdata, rawdata$Date >= "2007-2-1" & rawdata$Date<="2007-2-2")

# set the graph device
png(filename="plot3.png", width=480, height=480, units="px")

# plot the graph
with(subdata,{
  plot(Time,Sub_metering_1, main="", xlab="",ylab="Energy sub metering",type="l")
  lines(Time,Sub_metering_2,col="red")
  lines(Time,Sub_metering_3,col="blue")
  legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()
