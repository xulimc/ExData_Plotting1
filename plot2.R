#Read Data
bigdataset<-read.table("household_power_consumption.txt",sep=";",header=T,na.string='?',colClasses=c(rep("character",2),rep("numeric",7)))

#Pick Up the data with date 1/2/2007 or 2/2/2007
data<-subset(bigdataset,bigdataset$Date=="1/2/2007"|bigdataset$Date=="2/2/2007")

#Merge Date and Time into a DataTime variable
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

#Create plot2.png
png("plot2.png",height=480,width=480)

#Draw the plot
plot(data$DateTime,data$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

#Close device
dev.off()

