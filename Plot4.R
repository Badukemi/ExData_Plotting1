if(!file.exists("shortData.txt")){
    alldata<-read.table("household_power_consumption.txt", sep = ";", head=TRUE
                        ,na="?")
    
    plotdata<-alldata[as.Date(c("2007-02-01","2007-02-02"))== 
                          as.Date(strptime(alldata[,1], "%d/%m/%Y")),]
    x<-paste(plotdata$Date,plotdata$Time)
    plotdata$dtm<-strptime(x,"%d/%m/%Y %H:%M:%S")
    write.table(plotdata,file="shortData.txt",sep=";",row.names = FALSE)
    rm(alldata)
} else {plotdata<-read.table("shortData.txt", sep = ";", head=TRUE)}

png(file="plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))
#topleft
plot(plotdata$dtm,plotdata$Global_active_power,
     type="n",
     xlab="",
     ylab = "Global Active Power (kilowatts)",
     col="black")
lines(plotdata$dtm,plotdata$Global_active_power)
#topright
plot(plotdata$dtm,plotdata$Voltage,
     type="n",
     xlab="datetime",
     ylab = "Voltage",
     col="black")
lines(plotdata$dtm,plotdata$Voltage)
#bottom left
plot(plotdata$dtm,plotdata$Sub_metering_1,
     type="1",
     xlab="",
     ylab = "Energy sub metering",
     lwd=2,col="black")

lines(plotdata$dtm,plotdata$Sub_metering_2,col="red")
lines(plotdata$dtm,plotdata$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),
       c("sub_metering_1","sub_metering_2","sub_metering_3"),lwd=1)
#bottom right
plot(plotdata$dtm,plotdata$Global_reactive_power,
     type="n",
     xlab="datetime",
     ylab = "Global Reactive Power (kilowatts)",
     col="black")
lines(plotdata$dtm,plotdata$Global_reactive_power)
dev.off()