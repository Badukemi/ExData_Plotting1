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

png(file="plot3.png",width=480,height=480,units="px")

plot(plotdata$dtm,plotdata$Sub_metering_1,
     type="1",
     xlab="",
     ylab = "Energy sub metering",
     lwd=2,col="black")

lines(plotdata$dtm,plotdata$Sub_metering_2,col="red")
lines(plotdata$dtm,plotdata$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),
       c("sub_metering_1","sub_metering_2","sub_metering_3"),lwd=1)
dev.off()