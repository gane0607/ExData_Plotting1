library(data.table)
dataset<-fread("household_power_consumption.txt")
dataset<-dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]
dataset$Date<-as.Date(dataset$Date,format = "%d/%m/%Y")
dataset<-transform(dataset,
                   timestamp=as.POSIXct(paste(Date,Time)),
                   "%d/%m/%Y %H:%M:%S")
plot(dataset$timestamp,
     as.numeric(as.character(dataset$Global_active_power)),
     type="l",xlab="",ylab = "Global Active Power(kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
cat("Plot2.png has been saved in", getwd())