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
dataset$Voltage<-as.numeric(as.character(dataset$Voltage))
dataset$Global_active_power<-as.numeric(
  as.character(dataset$Global_active_power))
dataset$Global_reactive_power<-as.numeric(
  as.character(dataset$Global_reactive_power))
plot4<-function(){
  par(mfrow=c(2,2))
  plot(dataset$timestamp,dataset$Global_active_power, 
       type="l", xlab="", ylab="Global Active Power")
  plot(dataset$timestamp,dataset$Voltage, 
       type="l", xlab="datetime", ylab="Voltage")
  plot(dataset$timestamp,dataset$Sub_metering_1, 
       type="l", xlab="", ylab="Energy sub metering")
  lines(dataset$timestamp,dataset$Sub_metering_2,col="red")
  lines(dataset$timestamp,dataset$Sub_metering_3,col="blue")
  legend("topright", 
         col=c("black","red","blue"), 
         c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
         lty=c(1,1), bty="n", cex=.5)
  plot(dataset$timestamp,dataset$Global_reactive_power,
       type="l", xlab="datetime", ylab="Global_reactive_power")
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
  cat("plot4.png has been saved in", getwd())
}
plot4()
  

