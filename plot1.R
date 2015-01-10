#get data
DT <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string=c("?",""))

#transform date
DT$Date <- strptime(DT$Date, "%d/%m/%Y")

#filter data
DT2 <- subset(DT, as.Date(Date)=="2007-02-01"|as.Date(Date)=="2007-02-02")

#set margin 
par(mar=c(6,6,6,6))

#draw plots
hist(DT2$Global_active_power,col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")

#save as png
dev.copy(png, file="plot1.png") 

#close png device
dev.off()