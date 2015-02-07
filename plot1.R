#Read Data
bigdataset<-read.table("household_power_consumption.txt",sep=";",header=T,na.string='?',colClasses=c(rep("character",2),rep("numeric",7)))

#Pick Up the data with date 1/2/2007 or 2/2/2007
data<-subset(bigdataset,bigdataset$Date=="1/2/2007"|bigdataset$Date=="2/2/2007")

#Merge Date and Time into a DataTime variable
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

#Create plot1.png
png("plot1.png",height=480,width=480)

#Draw the histogram
hist(data$Global_active_power,col="red",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     main="Global Active Power")

#Close device
dev.off()
