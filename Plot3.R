##Read data
png("Plot3.png", width = 480, height = 480)
data<-read.table("C:/Users/johnk/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";")
##summary(data)
##head(data)


mysubset <- transform(subset(data, Date=="1/2/2007"| Date =="2/2/2007"),Date=format(as.Date(Date, format="%d/%m/%y"),"%Y-%m-%d"), Time=format(strptime(Time, format="%H:%M:%S"),"%H:%M:%S"))


mysubset2<-transform(mysubset, Global_active_power=as.numeric(as.character((Global_active_power))))
mysubset2<-transform(mysubset2, Sub_metering_1=as.numeric(as.character(Sub_metering_1)))
mysubset2<-transform(mysubset2, Sub_metering_2=as.numeric(as.character(Sub_metering_2)))
mysubset2<-transform(mysubset2, Sub_metering_3=as.numeric(as.character(Sub_metering_3)))



mysubset2$newtime <- as.POSIXct(paste(mysubset2$Date, mysubset2$Time), format="%Y-%m-%d %H:%M:%S")

head(mysubset2)
summary(mysubset2)

##With(mysubset, (plot(mysubset2$newtime, mysubset2$Sub_metering_1, type='l',xlab="",ylab="Global Active Power(kilowatts)")))


plot(mysubset2$newtime, mysubset2$Sub_metering_1, type='l',xlab="",ylab="Energy sub meeting"
            , ylim=c(0, max(mysubset2$Sub_metering_1)))

lines(mysubset2$newtime, mysubset2$Sub_metering_2, type='l',col='red')
lines(mysubset2$newtime, mysubset2$Sub_metering_3, type='l',col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , lty=1, lwd=2.5, col=c("black", "red", "blue"))


dev.off()

