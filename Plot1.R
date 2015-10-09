
if(!file.exists("shortData.txt")){
    alldata<-read.table("household_power_consumption.txt", sep = ";", head=TRUE)

    plotdata<-alldata[as.Date(c("2007-02-01","2007-02-02"))== 
                      as.Date(strptime(alldata[,1], "%d/%m/%Y")),]
    write.table(plotdata,file="shortData.txt",sep=";",row.names = FALSE)
    rm(alldata)
} else {plotdata<-read.table("shortData.txt", sep = ";", head=TRUE)}

#prepare your data for the graph
gap<-as.numeric(as.character(plotdata$Global_active_power))

#open the graphics device, a png file
png(file="plot1.png",width=480,height=480,units="px")

#plot
hist(gap, col="red", breaks=12, ylim=c(0,1200), main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
