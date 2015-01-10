#get data
DT <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string=c("?",""))

#filter data
DT2 <- subset(DT, Date=="1/2/2007"|Date=="2/2/2007")
DT2$DateTime <- strptime(paste(DT2$Date, DT2$Time), format="%d/%m/%Y %H:%M:%S")

#set timezone
Sys.setlocale("LC_TIME", "English")

#set margin 
par(mar=c(4,4,4,4))

#set mfrow
par(mfrow=c(2,2))
#draw plot1
with(DT2, 
     plot(DateTime, Global_active_power,
          type="l",bg=par("bg"),
	    xlab="",ylab="Global Active Power"))

#draw plot2
with(DT2, 
     plot(DateTime, Voltage,
          type="l",bg=par("bg"),
	    xlab="datetime",ylab="Voltage"))


#draw plot3
with(DT2, 
     plot(DateTime, Sub_metering_1,
	    xlab="",ylab="Energy sub metering",
	    type="n"))
with(DT2, 
     points(DateTime, Sub_metering_1,
          type="l",bg=par("bg"),col="black"))
with(DT2, 
     points(DateTime, Sub_metering_2,
          type="l",bg=par("bg"),col="red"))
with(DT2, 
     points(DateTime, Sub_metering_3,
          type="l",bg=par("bg"),col="blue"))

legend("topright",lty=1,
	  col=c("black","red","blue"), bg = "transparent", box.col = "transparent",
	  legend=c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  "))
#draw plot4
with(DT2, 
     plot(DateTime, Global_reactive_power,
          type="l",bg=par("bg"),
	    xlab="datetime",ylab="Global_reactive_power"))


#save as png
dev.copy(png, file="plot4.png") 

#close png device
dev.off()