#Read Data
bigdataset<-read.table("household_power_consumption.txt",sep=";",header=T,na.string='?',colClasses=c(rep("character",2),rep("numeric",7)))

#Pick Up the data with date 1/2/2007 or 2/2/2007
data<-subset(bigdataset,bigdataset$Date=="1/2/2007"|bigdataset$Date=="2/2/2007")

#Merge Date and Time into a DataTime variable
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

#Create plot3.png
png("plot3.png",height=480,width=480)

#Draw the plot
with(data,{
  plot(data$DateTime,data$Sub_metering_1,type='l',
            ylab="Energy sub metering",
            xlab="")
  lines(data$DateTime,data$Sub_metering_2,type='l',col="red")
  lines(data$DateTime,data$Sub_metering_3,type='l',col="blue")
})
legend("topright",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,
       lwd=2)

#Close device
dev.off()
