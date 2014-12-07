data<-read.table("household_power_consumption.txt",header=T,sep=";",nrows=70000)
data<-data[65000:70000,]
data$Date<-as.Date(data$Date,"%d/%m/%Y")
#data$Time<-paste(data$Date,data$Time) # I am really done with the Date type
#data$Time<-as.Date(data$Time,"%Y-%m-%d %H:%M:%S")
sub_data<-data[data$Date > "2007-01-31",]
sub_data<-sub_data[sub_data$Date < "2007-02-03",]
sub_data$Global_active_power<-as.numeric(as.character(sub_data$Global_active_power))
png(filename = "plot1.png",width = 480, height = 480, units = "px")
with(sub_data,hist(Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)"))
dev.off()
