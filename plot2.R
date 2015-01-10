#get data
DT <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string=c("?",""))


#filter data
DT2 <- subset(DT, Date=="1/2/2007"|Date=="2/2/2007")
DT2$DateTime <- strptime(paste(DT2$Date, DT2$Time), format="%d/%m/%Y %H:%M:%S")
#set margin 
par(mar=c(6,6,6,6))

#draw plots
with(DT2, 
     plot(DateTime, Global_active_power,
          type="l",bg=par("bg"),
	    xlab="",ylab="Global Active Power(kilowatts)"))

#save as png
dev.copy(png, file="plot2.png") 

#close png device
dev.off()