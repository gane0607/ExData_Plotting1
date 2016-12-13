library(data.table)
dataset<-fread("household_power_consumption.txt")
dataset<-dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]
dataset$Date<-as.Date(dataset$Date,format = "%d/%m/%Y")
dataset<-transform(dataset,
                   timestamp=as.POSIXct(paste(Date,Time)),
                   "%d/%m/%Y %H:%M:%S")
dataset$Sub_metering_1<-as.numeric(as.character(dataset$Sub_metering_1))
dataset$Sub_metering_2<-as.numeric(as.character(dataset$Sub_metering_2))
dataset$Sub_metering_3<-as.numeric(as.character(dataset$Sub_metering_3))
plot(dataset$timestamp,dataset$Sub_metering_1,
     type="l",xlab = "",ylab = "Energy sub metering")
lines(dataset$timestamp,dataset$Sub_metering_2,col="red")
lines(dataset$timestamp,dataset$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), 
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
cat("Plot3.png has been saved in", getwd())
