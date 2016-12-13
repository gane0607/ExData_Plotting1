library(data.table)
dataset<-fread("household_power_consumption.txt")
dataset<-dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]
hist(as.numeric(as.character(dataset$Global_active_power)),
     main="Global Active Power",
     xlab="Global Active Power(kilowatts)",
     ylab = "Frequency",col="red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
cat("Plot1.png has been saved in", getwd())