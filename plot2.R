data<-read.table("household_power_consumption.txt",header=T,sep=";",nrows=70000)
data<-data[65000:70000,]
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-paste(data$Date,data$Time) 
data$Time<-as.Date(data$Time,"%Y-%m-%d %H:%M:%S")
data$Time<-format(data$Time,"%a %H:%M:%S") # format() make it a chr type. I am really freak with this Date class
sub_data<-data[data$Date > "2007-01-31",]
sub_data<-sub_data[sub_data$Date < "2007-02-03",]
sub_data$Global_active_power<-as.numeric(as.character(sub_data$Global_active_power))
#create file
png(filename = "plot1.png",width = 480, height = 480, units = "px")
#set the margin to hide the xlab
par(mar=c(2,4,2,2))
#plot with the really dot
with(sub_data,plot(sub_data$Time,Global_active_power,ylab="Global Active Power(kilowatts)",pch="."))
#connect the dot
with(sub_data,lines(sub_data$Time,Global_active_power))
dev.off()
